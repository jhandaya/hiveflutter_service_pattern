import 'dart:io';
import 'dart:typed_data';
import 'package:hive_service_pattern/locator.dart';
import 'package:hive_service_pattern/model/myphotos_model.dart';
import 'package:stacked_services/stacked_services.dart';

import '/services/hive_service.dart';
import '/utils/image_helper.dart';
import '/utils/image_selector.dart';
import '/view_model/base_model.dart';

class MyPhotosAddViewModel extends BaseModel {
  final HiveService _hiveService = locator<HiveService>();
  HiveService get hiveService => _hiveService;

  final DialogService _dialogService = locator<DialogService>();
  DialogService get dialogService => _dialogService;

  File? _image;
  Future<void> selectImage() async {
    _image = await ImageSelector.instance.selectImageFromGallery();

    if (_image != null) {
      notifyListeners();
    }
  }

  File? get image => _image;

  void addMyImageModel(MyPhotosModel newImage) {
    newImage.id = uuid.v4();

    hiveService.imageRepo.save(newImage);
    notifyListeners();
  }

  double userRating = 3.0;

  void initializeLoad() {}

  File userImageFile = File('');

  Future<bool> prosesCheckIn() async {
    Uint8List? imageByteArray = await ImageHelper.compressImage(_image!);
    if (imageByteArray != null) {
      final MyPhotosModel myModelImage =
          MyPhotosModel(imageBinary: imageByteArray, id: uuid.v4());
      //save Image to Hive Local database
      addMyImageModel(myModelImage);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void navigateBackToGallery() {
    navigationService.back();
  }
}
