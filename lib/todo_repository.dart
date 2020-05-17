import 'package:aritrairis2020/todo.dart';

import 'package:hive/hive.dart';
//Functions used for manipulating and retrieving the records
abstract class TodoRepsitory {
 List getTodo(DateTime selectedDate);  //Using the selected date to get the to-do list
  void addTodo({Todo entry});
  void deleteTodo({int index,Todo entry});
  void completeTodo({int index,Todo entry});
  void editTodo({int index, Todo entry});
}

class UseHiveForTodo implements TodoRepsitory {
  @override
  List getTodo(DateTime selectedDate) {
    var sample= new Map();
    sample['realIndex']=-1;
    sample['entry']=Todo(task:'',completed: false,date: DateTime.now());

    final elements = Hive.box('todo');
    List<Map> todos=[sample];

    for (int i = 0; i < elements.length; i++) {

      Todo entry = elements.getAt(i);
          print("$selectedDate, $entry.index, ${entry.date}");
          //Note:flutter_intl package could have been used here, but for limiting the no. of third party packages, I used a manual check
      if (entry.date.day == selectedDate.day && entry.date.month == selectedDate.month && entry.date.year == selectedDate.year )
      //If the date is same as the selected date, we add a map to the list with the index in the database and the model class instance.
      { var details = new Map();
      details["realIndex"]=i;
      details["entry"]=entry;
        print("index $i, entry=${entry.title},Inside getTodo()");
        todos.add(details);

      }

    }
    todos.remove(sample);  //Removing the sample map used to initialize the list
      return todos;

    }

    @override
    void addTodo({Todo entry}) {
      print(entry.title); // function to add the data tp the database
      final element = Hive.box("todo");

      element.add(entry);
      print("Added item to the list,Inside addTodo()");
    }

    @override
    void deleteTodo({int index, Todo entry}) {
      final elements = Hive.box('todo');
      //Deleting the data at the current index
      elements.deleteAt(index);
      print("Inside deleteTodo()");
    }

    @override
    void completeTodo({int index, Todo entry}) {
      final elements = Hive.box('todo');

      Todo entry = elements.getAt(index);
      entry.completed = true;
      print("Completing todo,inside completeTodo()");
      elements.putAt(index, entry);
      print("Todo completed in hive");
    }

    @override
    void editTodo({int index, Todo entry}) {
      final elements = Hive.box('todo');

      elements.putAt(index, entry);
      print("Inside editTodo() changing to ${entry.title}");
    }
  }
