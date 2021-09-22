import 'package:flutter/material.dart';
import '/constant/app_colors.dart';
import '/view/myphotos_gallery_grid.dart';
import '/ui/widget/ui_helpers.dart';
import '/ui/widget/busy_button.dart';
import '/view_model/myphotos_gallery_view_model.dart';
import 'package:stacked/stacked.dart';

class MyPhotosGalleryView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  MyPhotosGalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPhotosGalleryViewModel>.reactive(
      viewModelBuilder: () => MyPhotosGalleryViewModel(),
      onModelReady: (model) => model.initializeLoad(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.kGrayColor,
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  verticalSpace25,
                  BusyButton(
                      title: 'Tambah Modelku',
                      busy: model.isBusy,
                      enabled: true,
                      onPressed: () async {
                        model.navigateToCheckIn();
                      }),
                  verticalSpace25,
                  const MyPhotosGalleryGrid(),
                  verticalSpace25,
                ],
              )),
        ),
      ),
    );
  }
}
