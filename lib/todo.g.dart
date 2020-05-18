// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model/todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final typeId = 0;

  @override
  Todo read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      task: fields[0] as String,
      date: fields[1] as DateTime,
      completed: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.task)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.completed);
  }
}
