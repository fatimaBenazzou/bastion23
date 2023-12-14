import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelScreen extends StatefulWidget {
  const ModelScreen({super.key});

  @override
  State<ModelScreen> createState() => _ModelScreenState();
}

class _ModelScreenState extends State<ModelScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: modelList.length,
      itemBuilder: (context, index) {
        return ModelItem(modelInfo: modelList[index]);
      },
    );
  }
}

class ModelItem extends StatelessWidget {
  final ModelInfo modelInfo;

  const ModelItem({Key? key, required this.modelInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ModelViewerPage(modelInfo: modelInfo)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display an image (you can replace AssetImage with NetworkImage if the images are remote)
            Image.asset(
              'images/${modelInfo.name.toLowerCase().replaceAll(" ", "_")}_thumb.jpg', // Adjust the path accordingly
              width: 64.0,
              height: 64.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            // Display the model name
            Text(
              modelInfo.name,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelViewerPage extends StatelessWidget {
  final ModelInfo modelInfo;

  const ModelViewerPage({Key? key, required this.modelInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(modelInfo.name,style:TextStyle(color: Colors.black))),
      body: ModelViewer(
        //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: modelInfo.path,
        alt: 'A 3D model',
        ar: true,
        arModes: ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        disableZoom: true,
      ),
    );
  }
}

class ModelInfo {
  final String name;
  final String path;

  ModelInfo({required this.name, required this.path});
}

// List of models
final List<ModelInfo> modelList = [
  ModelInfo(name: 'Bench 3D', path: 'Flutter_3D/bench.glb'),
  ModelInfo(name: 'Window', path: 'Flutter_3D/ta9a.glb'),
  ModelInfo(name: 'Cote Interieur', path: 'Flutter_3D/scene.glb'),
  ModelInfo(name: 'Door1', path: 'Flutter_3D/door1.glb'),
  ModelInfo(name: 'Door2', path: 'Flutter_3D/door2.glb'),
  ModelInfo(name: 'Algeria_flag', path: 'Flutter_3D/flag.glb'),
  ModelInfo(name: 'Cube', path: 'Flutter_3D/cube.glb'),
  ModelInfo(name: 'Mure', path: 'Flutter_3D/fpart.glb'),
];
