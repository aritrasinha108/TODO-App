part of 'todobloc_bloc.dart';

abstract class TodoblocState extends Equatable {
   TodoblocState();
}

class TodoblocInitial extends TodoblocState {

  @override
  List<Object> get props => [];
}
//We require only 1 state that needs to be added i.e GetTodo
class GetTodo extends TodoblocState {

 List todos;
   GetTodo(this.todos);

  @override
  // TODO: implement props
  List<Object> get props {
    //This function is used to add the equatable list for the state,
    List stateChange=[Todo(task: "",date: DateTime.now(),completed: false)];
    int i=0;
    while(i<todos.length)
      { stateChange.add(todos.elementAt(i)['entry'].title);
       stateChange.add(todos.elementAt(i)['entry'].completed.toString());
       stateChange.add(todos.elementAt(i)['entry'].date.day);
       stateChange.add(todos.elementAt(i)['entry'].date.month);
       stateChange.add(todos.elementAt(i)['entry'].date.year);
       i++;
      }
      stateChange.remove(Todo(task: "",date: DateTime.now(),completed: false));
      return stateChange;
  }
}




