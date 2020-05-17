import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends Equatable {
  @HiveField(0)
  String task;
  @HiveField(1)
  DateTime date; //Date of the todo
  @HiveField(2)
  bool completed;  //Status of completion,true if completed else false

  Todo({@required this.task,
      @required this. date,
      this.completed});

  String get title {
    return this.task;
  }
  String get tododate {
    return this.date.toString();
  }
  String get status {
    if(this.completed)
      return "DONE";
    else
      return "PENDING";
  }
  @override
  // TODO: implement props
  List<Object> get props => [task,date]; //The EQUATABLE has been used to check the equality
}