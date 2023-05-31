import 'package:hive_service_pattern/locator.dart';

import '/services/hive_service.dart';
import 'package:hive/hive.dart';
import '/model/myphotos_model.dart';
import '/view_model/base_model.dart';
import 'package:stacked_services/stacked_services.dart';

class MyPhotosGalleryViewModel extends BaseModel {
  // by allowing box is null we are able to detect if box has been initialized or not

  final HiveService _hiveService = locator<HiveService>();
  HiveService get hiveService => _hiveService;

  final DialogService _dialogService = locator<DialogService>();
  DialogService get dialogService => _dialogService;

  List<MyPhotosModel> myImageModel = [];

  late Box<MyPhotosModel> box;

  void initializeLoad() async {
    box = await hiveService.imageRepo.openBox();
    notifyListeners();
  }

  void addMyImageModel(MyPhotosModel newImage) {
    newImage.id = uuid.v4();
    hiveService.imageRepo.save(newImage);
    notifyListeners();
  }

  void deleteMyImage(MyPhotosModel myImageModel) async {
    await dialogService
        .showConfirmationDialog(
            title: 'Delete',
            description: 'Delete this iamge ?',
            cancelTitle: 'Cancel',
            confirmationTitle: 'Yes')
        .then((DialogResponse? value) {
      if (value != null) {
        if (value.confirmed) {
          hiveService.imageRepo.delete(myImageModel.id);
          notifyListeners();
        }
      }
    });
  }

  void navigateToCheckIn() {
    navigationService.navigateTo("AddView");
  }
}
