import 'dart:async';
import '../main.dart';
import '../model/todo.dart';
import '../notifications/notifications.dart';
import '../model/todo_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'todobloc_event.dart';
part 'todobloc_state.dart';

class TodoblocBloc extends Bloc<TodoblocEvent, TodoblocState> {
  final TodoRepsitory repository;

  TodoblocBloc(this.repository);

  @override
  //Initially when the app starts we show all the todos from the current date
  TodoblocState get initialState => GetTodo(repository.getTodo(DateTime.now()));

  @override
  Stream<TodoblocState> mapEventToState(
    TodoblocEvent event,
  ) async* {
    if (event is GetTodoEvent) {
      List todos = repository.getTodo(event.selectedDate);
      yield GetTodo(todos);
    } else if (event is AddTodoEvent) {
      repository.addTodo(entry: event.entry, manager: event.manager);

      print("loaded list1");
      print("${event.entry.date}, ${event.entry.title}");
      List todos = repository.getTodo(event.entry.date);
      print("loaded list2");

      yield GetTodo(todos);
      print("Returning Get todo state");
    } else if (event is EditTodoEvent) {
      repository.editTodo(
          entry: event.entry, index: event.index, manager: event.manager);

      List todos = repository.getTodo(event.entry.date);
      print("Yielding EditTodo state");
      yield GetTodo(todos);
      print("Returning Get todo state");
    } else if (event is DeleteTodoEvent) {
      repository.deleteTodo(
          index: event.index, entry: event.entry, manager: event.manager);

      List todos = repository.getTodo(event.entry.date);
      print("Yielding DeleteTodo state");
      yield GetTodo(todos);
      print("Returning Get todo state");
    } else if (event is CompleteTodoEvent) {
      repository.completeTodo(
          index: event.index, entry: event.entry, manager: event.manager);

      List todos = repository.getTodo(event.entry.date);
      yield GetTodo(todos);
      print("Yielding Get Todo state");
      for (int i = 0; i < todos.length; i++)
        print(
            "${todos.elementAt(i)['entry'].title}, ${todos.elementAt(i)['entry'].completed}");
    } else if (event is ShiftTodoEvent) {
      repository.shiftTodo(
          entry: event.entry, manager: event.manager, index: event.index);
      List todos = repository.getTodo(event.previousDate);
      print("Yielding Get Todo State");
      manager.getNotificationInstance().show(event.index, 'Todo shifted',
          'Your Todo ${event.entry.title} has been shifted to${event.entry.date.day}/${event.entry.date.month}/${event.entry.date.year}',
            manager.getPlatformChannelSpecifics());
      yield GetTodo(todos);
    }
  }
}
