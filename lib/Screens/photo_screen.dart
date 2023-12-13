import 'dart:io';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:camera_func/Screens/qr_scanner_screen.dart';
import 'package:camera_func/Screens/video_screen.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:gallery_saver/gallery_saver.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  CameraScreen(this.cameras);
  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool isCapturing=false;
  //for Switching camera
  int _selectedCameraIndex=0;
  bool _isFrontCamera=false;
  //For flashLight
  bool _isFlashOn=false;

  //For Focucing
  Offset? _focusPoint;
  //For Zoom
  double _currentZoom=1.0;

  File? _capturedImage;

  //For Making Sound
  AssetsAudioPlayer audioPlayer=AssetsAudioPlayer();

  //
  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState((){});
    });
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  void _toggleFlashLight(){
  if(_isFlashOn){
    _controller.setFlashMode(FlashMode.off);
    setState(() {
      _isFlashOn=false;
    });
  }
  else{
    _controller.setFlashMode(FlashMode.torch);
    setState(() {
      _isFlashOn=true;
    });
  }
  }
  //Function to switch camera
  void _switchCamera() async{
    if(_controller != null){
      //Dispose the current controller to release the camera resource
      await _controller.dispose();
    }
    //Incremente or reset the selected camera index

    _selectedCameraIndex=(_selectedCameraIndex+1)%widget.cameras.length;

    //Initialize the new camera
    _initCamera(_selectedCameraIndex);
  }

  Future<void> _initCamera(int cameraIndex)async{
    _controller=CameraController(widget.cameras[cameraIndex], ResolutionPreset.max);
    try{
      await _controller.initialize();
      setState(() {
        if(cameraIndex==0){
          _isFrontCamera=false;
        }
        else{
          _isFrontCamera=true;
        }
      });
    }catch(e){
      print("Error:${e}");
    }

    if(mounted){
      setState(() {

      });
    }
  }

  void CapturePicture() async{

    if(!_controller.value.isInitialized){
      return;
    }
    final Directory appDir= await pathProvider.getApplicationSupportDirectory();
    final String capturePath= path.join(appDir.path,'${DateTime.now()}.jpg');
    if(_controller.value.isTakingPicture){
      return;
    }
    try{
      setState(() {
        isCapturing=true;
      });
      final XFile capturedImage = await _controller.takePicture();
      String imagePath = capturedImage.path;
      await GallerySaver.saveImage(imagePath);
      print("Photo captured and saved to the gallery");
      
      //Play a capture Image sound effect 
      audioPlayer.open(Audio('music/cameracapture.mp3'));
      audioPlayer.play();
      //for Showing the image in the left corner
      final String filePath= '$capturePath/${DateTime.now().millisecondsSinceEpoch}.jpg';

      _capturedImage=File(capturedImage.path);
      _capturedImage!.renameSync(filePath);

    }catch(e){
      print("Error capturing picture: ${e}");
    }finally{
      setState(() {
        isCapturing=false;
      });
    }
  }
//Function to zoom in and zoom out
  void zoomCamera(double value){
    setState(() {
      _currentZoom=value;
      _controller.setZoomLevel(value);
    });
    
  }

  //function
  Future<void> _setFocusPoint(Offset point)async{
    if(_controller != null && _controller.value.isInitialized)
      {
        try{
          final double x=point.dx.clamp(0.0,1.0);
          final double y= point.dy.clamp(0.0,1.0);
          await _controller.setFocusPoint(Offset(x, y));
          await _controller.setFocusMode(FocusMode.auto);
          setState(() {
            _focusPoint= Offset(x, y);
          });
          //Reset _focus after a short delay to remove the square
          await Future.delayed(Duration(seconds:2));
          setState(() {
            _focusPoint=null;
          });
        }catch(e){
          print("Failed to set focus: ${e}");
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    return SafeArea(
        child: Scaffold(
          body: LayoutBuilder(
            builder: (BuildContext context ,BoxConstraints constraints){
              return Stack(
                children: [
                  Positioned(
                    top:0,
                    left:0,
                    right:0,
                    child: Container(
                      height:50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: const EdgeInsets.all(10.0),
                              child:GestureDetector(
                                  onTap: (){
                                    _toggleFlashLight();
                                  },
                                  child: _isFlashOn==false ? Icon(Icons.flash_off, color:Colors.black): Icon(Icons.flash_on, color:Colors.black),
                              ),
                            ),
                          Padding(padding:const EdgeInsets.all(10.0),
                            child:GestureDetector(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (c) => QrScannerScreen(camera: widget.cameras.first)));
                                  },
                                child: Icon(Icons.qr_code_scanner,color:Colors.black))
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned.fill(
                  top:50,
                  bottom: _isFrontCamera==false ? 0: 150,
                    child: AspectRatio(
                      aspectRatio:_controller.value.aspectRatio ,
                      child: GestureDetector(
                        onTapDown: (TapDownDetails details){
                          final Offset tapPosition=details.localPosition;
                          final Offset relativeTapPosition=Offset(tapPosition.dx/constraints.maxWidth,
                              tapPosition.dy/constraints.maxHeight,
                          );
                          _setFocusPoint(relativeTapPosition);
                        },
                          child: CameraPreview(_controller)),
                  ),
                  ),
                  //Slider
                  Positioned(
                    top:50,
                    right:10,
                    child: SfSlider.vertical(
                    max:5.0,
                    min:1.0,
                    activeColor: Colors.black,
                    value: _currentZoom,
                    onChanged: (dynamic value){
                      setState(() {
                        zoomCamera(value);
                      });
                    },
                    )

                  ),
                  if(_focusPoint!=null)
                    Positioned.fill(
                      top:50,
                      child: Align(
                        alignment: Alignment(_focusPoint!.dx * 2 - 1,_focusPoint!.dy * 2 - 1),
                        child:Container(
                          height:80,
                          width:80,
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.black, width:2),
                          ),
                        )
                      )
                    ),
                  Positioned(
                    bottom:0,
                    left:0,
                    right:0,
                    child: Container(
                      height:150,
                      decoration: BoxDecoration(
                        color: _isFrontCamera==false ? Colors.white :Colors.white,
                      ),
                      child:Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    //make link between photo option and video option
                                    Navigator.push(context, MaterialPageRoute(builder:(c)=> VideoScreen(widget.cameras)));
                                  },
                                  child: Center(
                                    child: Text('Video',
                                    style: TextStyle(
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text('Photo',
                                    style: TextStyle(
                                      color:Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text('Pro Mode',
                                    style: TextStyle(
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                ),
                              ),

                            ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Container(
                                        child:Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            _capturedImage !=null ? Container(
                                              width:50,
                                              height:50,
                                              child:Image.file(
                                                _capturedImage!,
                                                fit: BoxFit.cover,
                                              ),

                                            ):Container(),
                                          ],
                                        )
                                      )),

                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                            CapturePicture();
                                          },
                                          child: Center(
                                            child: Container(
                                              height:70,
                                              width:70,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(50),
                                                  border: Border.all(
                                                    width:4,
                                                    color: Colors.black,
                                                    style:BorderStyle.solid,

                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: GestureDetector(
                                            onTap: (){
                                              _switchCamera();
                                            },
                                            child: Icon(Icons.cameraswitch_outlined, color: Colors.black, size:30),
                                          ))
                                    ],
                                  )
                                  //camera
                                ],

                          ))

                        ],
                      )
                    )
                  ),
                  //Camera

                ],
              );
            },
          )
    )
    );
  }
}
