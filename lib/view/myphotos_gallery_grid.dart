import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '/model/myphotos_model.dart';
import '/ui/widget/lazy_network_image.dart';
import '/view_model/myphotos_gallery_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyPhotosGalleryGrid extends ViewModelWidget<MyPhotosGalleryViewModel> {
  const MyPhotosGalleryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MyPhotosGalleryViewModel model) {
    if (model.box != null) {
      return ValueListenableBuilder<Box<MyPhotosModel>>(
        valueListenable: model.box!.listenable(),
        builder: (context, Box<MyPhotosModel> box, _) {
          model.myImageModel = box.values.toList().cast<MyPhotosModel>();

          if (model.myImageModel.isEmpty) {
            return Container();
          } else {
            return Expanded(
              child: CarouselSlider.builder(
                itemCount: model.myImageModel.length,
                itemBuilder: (context, index, realIndex) {
                  final myImage = model.myImageModel[index];
                  return Card(
                    color: Colors.white,
                    elevation: 5.0,
                    child: GestureDetector(
                      onLongPress: () {
                        model.deleteMyImage(model.myImageModel[index]);
                      },
                      child: Center(
                        child: LazyNetworkImage(
                          imageFile: myImage.imageBinary,
                          imageUrl: null,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    height: 500,
                    scrollDirection: Axis.vertical,
                    viewportFraction: 0.9),
              ),
            );
          }
        },
      );
    } else {
      return Container();
    }
  }
}
