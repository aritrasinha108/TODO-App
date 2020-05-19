import '../notifications/notifications.dart';

import '../bloc/todobloc_bloc.dart';
import 'todo_card.dart';
import 'package:flutter/material.dart';

Widget buildList({DateTime selectedDate, TodoblocState state, TodoblocBloc todoBloc,NotificationManager manager })
{
  print("Inside BuildList");
  final TextEditingController controller = TextEditingController();

      //If the state is GetTodo and the two states are not equal, we reload a list Map containing the index and the instances of the Todo class
        if (state is GetTodo) {

          print("state is getTodo");
          //If the list is empty , the container with a message is returned
          if(state.todos.isEmpty)
            return Container(
              color: Colors.transparent,
              child: Text(
                "No todos to show",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'DMMono',


                    fontStyle: FontStyle.italic,
                  fontSize: 44
                ),
              ),

            );
          //else we return a listview of several the todos
          else
          {
            return ListView.builder(

              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                print("entry is: ${state.todos[index]['entry'].title}, ${state.todos[index]['entry'].completed}");

                  return TodoCard(index: state.todos[index]['realIndex'],
                      context: context,
                      controller: controller,
                      entry: state.todos[index]['entry'],
                      selectedDate: selectedDate,
                      todoBloc: todoBloc,
                  manager: manager);

              });//Here real index is the index of the todos inside the Hive datatbase
          }
        }



}


