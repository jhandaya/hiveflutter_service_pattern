import 'package:flutter/material.dart';
import '/constant/app_colors.dart';
import '/ui/widget/ui_helpers.dart';
import '/ui/widget/busy_button.dart';
import '/ui/widget/image_picker_widget.dart';
import '/ui/widget/rating_bar_widget.dart';
import '/view_model/myphotos_add_view_model.dart';

import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MyPhotosAddView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  MyPhotosAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPhotosAddViewModel>.reactive(
      viewModelBuilder: () => MyPhotosAddViewModel(),
      onModelReady: (model) => model.initializeLoad(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.kGrayColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpace10,
                    verticalSpace25,
                    verticalSpace10,
                    verticalSpace25,
                    Consumer<MyPhotosAddViewModel>(builder: (_, provider, ___) {
                      return ImagePickerWidget(
                        onPressed: () async {
                          provider.selectImage();
                        },
                        image: provider.image,
                      );
                    }),
                    verticalSpace10,
                    RatingBarWidget(
                      mode: 1,
                      initialRating: 4,
                    ),
                    verticalSpace50,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BusyButton(
                          title: 'Check In',
                          busy: model.isBusy,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              //Save Image to Hive
                              bool result = await model.prosesCheckIn();
                              if (result) {
                                // show dialog success and then
                                await model.dialogService.showDialog(
                                    buttonTitle: "OK",
                                    description: "Successfuly Save",
                                    title: "Successfuly Save");

                                model.navigateBackToGallery();
                              } else {
                                // show dialog fail to save
                                await model.dialogService.showDialog(
                                    buttonTitle: "OK",
                                    description: "Save Fail",
                                    title: "Save Failed");
                              }
                            }
                          },
                        )
                      ],
                    ),
                    verticalSpace25,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
