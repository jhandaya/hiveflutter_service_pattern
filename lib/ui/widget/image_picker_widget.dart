import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '/constant/app_colors.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? image;
  final bool isImageErrorVisible;
  final VoidCallback? onPressed;
  final Uint8List? imageBinary;

  const ImagePickerWidget(
      {Key? key,
      this.onPressed,
      required this.image,
      this.isImageErrorVisible = false,
      this.imageBinary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.kBlackBorderColor,
        ),
        image: (image != null)
            ? DecorationImage(
                image: FileImage(image!),
                fit: BoxFit.fill,
              )
            : (imageBinary != null)
                ? DecorationImage(
                    image: MemoryImage(imageBinary!),
                    fit: BoxFit.cover,
                  )
                : null,
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: IconButton(
              icon: const Icon(
                Icons.camera_alt_sharp,
              ),
              iconSize: 25,
              onPressed: onPressed,
            ),
          ),
          isImageErrorVisible
              ? const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Please select an image',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
