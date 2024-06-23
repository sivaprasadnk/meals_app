// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealHiveModelAdapter extends TypeAdapter<MealHiveModel> {
  @override
  final int typeId = 0;

  @override
  MealHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealHiveModel(
      idMeal: fields[0] as String,
      strMeal: fields[1] as String,
      strCategory: fields[2] as String,
      strArea: fields[3] as String,
      strInstructions: fields[4] as String,
      strMealThumb: fields[5] as String,
      strTags: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.idMeal)
      ..writeByte(1)
      ..write(obj.strMeal)
      ..writeByte(2)
      ..write(obj.strCategory)
      ..writeByte(3)
      ..write(obj.strArea)
      ..writeByte(4)
      ..write(obj.strInstructions)
      ..writeByte(5)
      ..write(obj.strMealThumb)
      ..writeByte(6)
      ..write(obj.strTags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
