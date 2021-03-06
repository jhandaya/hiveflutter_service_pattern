// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myphotos_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyPhotosModelAdapter extends TypeAdapter<MyPhotosModel> {
  @override
  final int typeId = 1;

  @override
  MyPhotosModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyPhotosModel(
      id: fields[0] as String,
      title: fields[1] as String,
      imageBinary: fields[2] as Uint8List,
      isFavorite: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MyPhotosModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageBinary)
      ..writeByte(3)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyPhotosModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
