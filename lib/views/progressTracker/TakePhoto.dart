import 'dart:typed_data'; // For Uint8List
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/widgets/Text.dart';
import 'package:image_picker/image_picker.dart';

import '../../Controllers/ProgressTrackerControllers/TakePhotoController.dart';
import '../../constants/Colors.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
class TakePhoto extends StatelessWidget {
  final TakePhotoController controllerX = Get.find();

  List<String> placeHolderImages = [
    "front.png",
    "left.png",
    "back.png",
    "right.png"
  ];

  Future<void> pickImage() async {
    final picker = ImagePicker();

    // Pick an image from the gallery
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Read image bytes (Uint8List) for web compatibility
      final Uint8List imageBytes = await image.readAsBytes();

      // Save the selected image bytes in the corresponding placeholder
      controllerX.selectImage(controllerX.currentPoseIndex.value, imageBytes);

      // Increment the current pose index
      controllerX.incrementPoseIndex();
    } else {
      Get.snackbar("Error", "No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Capture button at the bottom center
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                child: InkWell(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: purpleGradient,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        'cameraIcon.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Placeholders for the 4 poses (front, left, back, right) at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(() => Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                children: List.generate(4, (index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: controllerX.imagesBytes[index] != null
                        ? Image.memory(
                      controllerX.imagesBytes[index]!,
                      fit: BoxFit.cover,
                    )
                        : Center(
                      child: Image.asset(
                        placeHolderImages[index],
                        width: 20,
                        height: 80,
                      ),
                    ),
                  );
                }),
              ),
            )),
          ),

          // Done button at the top-right corner
          Positioned(
            top: 20,
            right: 16,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  if (controllerX.areAllImagesSelected()) {
                    Get.snackbar("Success", "All photos selected successfully");
                  } else {
                    Get.snackbar("Incomplete", "Please select all 4 poses");
                  }
                },
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: blueGradient),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: MyText(
                      title: 'Done',
                      color: white,
                      fontWeight: w500,
                      size: size14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
