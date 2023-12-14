import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({super.key});
  final List<String> images = List.generate(9, (index) => 'assets/images/image$index.jpg');

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showImagePopup(context, index);
            },
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      );
  }

  
  void _showImagePopup(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        void goToNextImage() {
          if (index < images.length - 1) {
            Navigator.of(context).pop();
            _showImagePopup(context, index + 1);
          }
        }

        void goToPreviousImage() {
          if (index > 0) {
            Navigator.of(context).pop();
            _showImagePopup(context, index - 1);
          }
        }

        return Dialog(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Expanded(
               child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton.outlined(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: goToPreviousImage,
                  ),
                  IconButton.outlined(
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.white,
                    onPressed: goToNextImage,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
      }
    );
  }
}

