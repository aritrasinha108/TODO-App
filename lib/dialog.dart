import 'package:aritrairis2020/bloc/todobloc_bloc.dart';
import 'package:flutter/material.dart';
import 'text_field.dart';

//This dialog box is used to add or edit a todo
Widget DialogBox(
    {String Title,
      Function Manipulation,
    TextEditingController controller,
    TodoblocBloc todoBloc}) {
  return AlertDialog(
    //Uses an alert dialog
    elevation: 16.0,
    backgroundColor: Colors.white12.withOpacity(0.7),
    //Reducing opacity
    title: Text(
      Title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 28.0,
          color: Colors.teal[400].withOpacity(0.7),
          //Title of the dialogue box
          fontStyle: FontStyle.italic,
          fontFamily: 'DMMono'),
    ),

    //                   Taking the todo as input here

    content: inputTodo(controller),
    actions: <Widget>[
      FlatButton(
        child: Text(
          'OK',
          textAlign: TextAlign.center,
          style: TextStyle(
              //After pressing the button "Add" the data will be added to the list
              fontSize: 28.0,
              color: Colors.pinkAccent.withOpacity(0.7),
              fontStyle: FontStyle.italic,
              fontFamily: 'DMMono'),
        ),
        onPressed: Manipulation,
      )
    ],
  );
}

Widget DeleteOrCompleteDialog(
    {String Title,String Body,Function Cancel, Function Confirm, TodoblocBloc todoBloc}) {
  return AlertDialog(
    backgroundColor: Colors.white70.withOpacity(0.7),
    elevation: 16.0,
    title: Text(
      Title,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 28.0,
          color: Colors.teal[400].withOpacity(0.7),
          fontStyle: FontStyle.italic,
          fontFamily: 'DMMono'),
    ),
    //Message to be displayed
    content: Text(
      Body,
      style: TextStyle(
        fontFamily: 'DMMono',
        fontSize: 30.0,
        //Fonts downloaded from Google fonts
        fontStyle: FontStyle.italic,
        color: Colors.black.withOpacity(0.7),

      ),
    ),
    actions: <Widget>[
      FlatButton(
          //On pressing this the deletion won't take place
          child: Text(
            "Cancel",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.teal[400].withOpacity(0.7),
                fontStyle: FontStyle.italic,
                ),
          ),
          onPressed: Cancel),
      FlatButton(
          //This will delete the data
          child: Text(
            "CONFIRM",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28.0,
                color: Colors.teal[400].withOpacity(0.7),
                fontStyle: FontStyle.italic,
                ),
          ),
          onPressed: Confirm)
    ],
  );
}
