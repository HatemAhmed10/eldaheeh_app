// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessonModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class lessonModelAdapter extends TypeAdapter<lessonModel> {
  @override
  final int typeId = 0;

  @override
  lessonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return lessonModel(
      teacherName: fields[0] as String,
      teacherID: fields[1] as String,
      studentList: (fields[2] as List).cast<dynamic>(),
      lessonName: fields[3] as String,
      lessonID: fields[4] as String,
      lessonPrice: fields[5] as String,
      officeRate: fields[6] as String,
      teacherRate: fields[7] as String,
      tomasrate: fields[8] as String,
      studentInf: (fields[9] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as List).cast<dynamic>())),
    );
  }

  @override
  void write(BinaryWriter writer, lessonModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.teacherName)
      ..writeByte(1)
      ..write(obj.teacherID)
      ..writeByte(2)
      ..write(obj.studentList)
      ..writeByte(3)
      ..write(obj.lessonName)
      ..writeByte(4)
      ..write(obj.lessonID)
      ..writeByte(5)
      ..write(obj.lessonPrice)
      ..writeByte(6)
      ..write(obj.officeRate)
      ..writeByte(7)
      ..write(obj.teacherRate)
      ..writeByte(8)
      ..write(obj.tomasrate)
      ..writeByte(9)
      ..write(obj.studentInf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is lessonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
