import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'dart:io';

class ImageSelector {
  static ImageSelector get instance => ImageSelector();

  Future<File?> selectImageFromGallery() async {
    XFile? pickedFile;

    pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 50);

    return (pickedFile != null) ? File(pickedFile.path) : null;
  }

  Future<File?> selectImageFromCamera() async {
    XFile? pickedFile;
    pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 50);

    return pickedFile != null ? File(pickedFile.path) : null;
  }

  Future<File?> cropImageFromFile() async {
    // TakeImage from user's photo
    File imageFileFromLibrary;
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 640,
        maxHeight: 480,
        imageQuality: 100);

    if (pickedFile != null) {
      imageFileFromLibrary = File(pickedFile.path);
      // Start crop iamge then take the file.
      File? croppedFile = await ImageCropper().cropImage(
          sourcePath: imageFileFromLibrary.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: const IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));

      return croppedFile;
    }
    return null;
  }
}
