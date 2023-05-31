import 'package:flutter/material.dart';
import '/model/myphotos_model.dart';
import '/ui/widget/lazy_network_image.dart';
import '/view_model/myphotos_gallery_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyPhotosGalleryGrid extends ViewModelWidget<MyPhotosGalleryViewModel> {
  const MyPhotosGalleryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MyPhotosGalleryViewModel viewModel) {
    return ValueListenableBuilder<Box<MyPhotosModel>>(
      valueListenable: viewModel.box.listenable(),
      builder: (context, Box<MyPhotosModel> box, _) {
        viewModel.myImageModel = box.values.toList().cast<MyPhotosModel>();

        if (viewModel.myImageModel.isEmpty) {
          return Container();
        } else {
          return Expanded(
            child: CarouselSlider.builder(
              itemCount: viewModel.myImageModel.length,
              itemBuilder: (context, index, realIndex) {
                final myImage = viewModel.myImageModel[index];
                return Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: GestureDetector(
                    onLongPress: () {
                      viewModel.deleteMyImage(viewModel.myImageModel[index]);
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
  }
}
