import 'package:hive/hive.dart';
import '/locator.dart';
import '/model/myphotos_model.dart';
import '/services/photo_gallery_repository.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

class HiveService {
  HiveService() {
    //register adapter
    registerAdapter();
  }

  void registerAdapter() {
    // Register All Hive Adapter Here
    Hive.registerAdapter(MyPhotosModelAdapter());
  }

  final PhotoGalleryRepository _imageRepository =
      locator<PhotoGalleryRepository>();
  PhotoGalleryRepository get imageRepo => _imageRepository;

  void clearAllBox() async {}

  void initTestData() async {
    final List<MyPhotosModel> _listImage = [];

    var repo = await _imageRepository.read();
    if (repo.isEmpty) {
      for (var element in _listImage) {
        element.id = uuid.v4();
        _imageRepository.save(element);
      }
    }
  }
}
