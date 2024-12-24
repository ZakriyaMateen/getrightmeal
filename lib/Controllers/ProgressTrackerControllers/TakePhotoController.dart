import 'dart:typed_data'; // For Uint8List
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/widgets/Text.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/Colors.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart'; // For selecting images from the gallery

class TakePhotoController extends GetxController {
  // List to hold the selected image bytes (Uint8List) for web
  RxList<Uint8List?> imagesBytes = List<Uint8List?>.filled(4, null).obs;

  // Reactive variable to hold the current pose index
  RxInt currentPoseIndex = 0.obs;

  // Method to store image at specific index (0: Front, 1: Left, 2: Back, 3: Right)
  void selectImage(int index, Uint8List imageBytes) {
    imagesBytes[index] = imageBytes;
  }

  // Increment the current pose index
  void incrementPoseIndex() {
    if (currentPoseIndex.value < 3) {
      currentPoseIndex.value++;
    } else {
      Get.snackbar("Complete", "All photos have been selected");
    }
  }

  // Check if all 4 images are selected
  bool areAllImagesSelected() {
    return imagesBytes.every((image) => image != null);
  }
}

