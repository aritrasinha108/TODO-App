import 'package:flutter/material.dart';
//TEXT-FIELD used in the app
Widget inputTodo(TextEditingController _controller)
{
  return TextField(
    style: TextStyle(
      decorationColor: Colors.white12.withOpacity(0.9),
      //Adding Style to the text field
      fontFamily: 'Cardo',
      fontSize: 25.0,
      fontStyle: FontStyle.italic,
      color: Colors.black.withOpacity(0.7),
      fontWeight: FontWeight.bold,
    ),
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter here",
        labelText: 'Enter a todo to add'),
    controller:
    _controller, //this controller has been declared above
  );
}