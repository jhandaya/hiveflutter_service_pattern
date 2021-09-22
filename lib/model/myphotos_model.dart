import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'myphotos_model.g.dart';

@HiveType(typeId: 1)
class MyPhotosModel extends HiveObject {
  MyPhotosModel(
      {required this.id,
      this.title = "",
      required this.imageBinary,
      this.isFavorite = false});

  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  Uint8List imageBinary;

  @HiveField(3)
  bool isFavorite;
}
