import 'package:hive/hive.dart';

import 'hive_const.dart';
import '/model/myphotos_model.dart';

class PhotoGalleryRepository {
  late Future<Box<MyPhotosModel>> _mBox;
  PhotoGalleryRepository();

  Future<Box<MyPhotosModel>> openBox() {
    _mBox = Hive.openBox<MyPhotosModel>(HiveConstant.myphotosBoxName);
    return _mBox;
  }

  Future<List<MyPhotosModel>> read() async {
    Box<MyPhotosModel> box = await openBox();
    return box.values.toList();
  }

  Future<List<MyPhotosModel>> getMyImage() async {
    Box<MyPhotosModel> box = await openBox();
    final returnList = box.values.toList();
    await box.close();
    return returnList;
  }

  void save(MyPhotosModel myImageModel) async {
    Box<MyPhotosModel> box = await openBox();
    box.put(myImageModel.id, myImageModel);
  }

  void update(MyPhotosModel myImageModel) async {
    Box<MyPhotosModel> box = await openBox();
    box.put(myImageModel.id, myImageModel);
  }

  void delete(String id) async {
    Box<MyPhotosModel> box = await openBox();
    box.delete(id);
  }

  void clearBox() async {
    Box<MyPhotosModel> box = await openBox();
    box.deleteAll(box.keys);
  }
}
