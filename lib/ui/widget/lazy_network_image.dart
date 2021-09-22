import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:photo_view/photo_view.dart';

import '/constant/app_colors.dart';

const grey100 = Color(0xFFF5F5F5);
const grey300 = Color(0xFFE0E0E0);

class LazyNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final Uint8List? imageFile;

  const LazyNetworkImage({Key? key, this.imageUrl, this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Shimmer.fromColors(
        baseColor: grey300,
        highlightColor: grey100,
        child: Center(
          child: Container(
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
      imageFile != null
          ? PhotoView(imageProvider: MemoryImage(imageFile!))
          : ((imageUrl != null)
              ? FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imageUrl ?? "",
                  fit: BoxFit.cover,
                )
              : Container()),
    ]);
  }
}
