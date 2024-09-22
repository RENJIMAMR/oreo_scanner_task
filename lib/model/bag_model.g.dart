// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BagModelAdapter extends TypeAdapter<BagModel> {
  @override
  final int typeId = 2;

  @override
  BagModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BagModel(
      time: fields[0] as String?,
      date: fields[1] as String?,
      bagItems: (fields[2] as List?)?.cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, BagModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.bagItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BagModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
