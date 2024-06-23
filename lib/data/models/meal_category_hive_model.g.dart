// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_category_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealCategoryHiveModelAdapter extends TypeAdapter<MealCategoryHiveModel> {
  @override
  final int typeId = 1;

  @override
  MealCategoryHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealCategoryHiveModel(
      idCategory: fields[0] as String,
      strCategory: fields[1] as String,
      strCategoryThumb: fields[2] as String,
      strCategoryDescription: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealCategoryHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.idCategory)
      ..writeByte(1)
      ..write(obj.strCategory)
      ..writeByte(2)
      ..write(obj.strCategoryThumb)
      ..writeByte(3)
      ..write(obj.strCategoryDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealCategoryHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
