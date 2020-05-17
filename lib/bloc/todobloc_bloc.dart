import 'dart:async';
import 'package:aritrairis2020/todo.dart';
import 'package:aritrairis2020/todo_repository.dart';
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
    if(event is GetTodoEvent)
      {
        List todos= repository.getTodo(event.selectedDate);
        yield GetTodo(todos);
      }
    else if (event is AddTodoEvent)
      {
        repository.addTodo(entry:event.entry);


        print("loaded list1");
        print("${event.entry.date}, ${event.entry.title}");
        List todos=repository.getTodo(event.entry.date);
        print("loaded list2");

        yield GetTodo(todos);
        print("Returning Get todo state");

      }
    else if(event is EditTodoEvent )
      {
        repository.editTodo(entry:event.entry,index: event.index);

        List  todos=repository.getTodo(event.entry.date);
        print("Yielding EditTodo state");
        yield GetTodo(todos);
        print("Returning Get todo state");
      }
    else if(event is DeleteTodoEvent)
      {   repository.deleteTodo(index: event.index,entry: event.entry);

        List todos=repository.getTodo(event.entry.date);
        print("Yielding DeleteTodo state");
        yield GetTodo(todos);
        print("Returning Get todo state");
      }
    else if(event is CompleteTodoEvent)
      {    repository.completeTodo(index: event.index,entry: event.entry);



        List todos=repository.getTodo(event.entry.date);
        yield GetTodo(todos);
        print("Yielding Get Todo state");
        for(int i=0;i<todos.length;i++)
          print("${todos.elementAt(i)['entry'].title}, ${todos.elementAt(i)['entry'].completed}");
      }
  }
}
