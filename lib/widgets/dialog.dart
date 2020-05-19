import 'package:aritrairis2020/main.dart';
import 'package:table_calendar/table_calendar.dart';
import '../model/todo.dart';
import '../bloc/todobloc_bloc.dart';
import '../notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'text_field.dart';

//This dialog box is used to add or edit a todo
Widget DialogBox(
    {String Title,
      NotificationManager manager,
      Function Manipulation,
      Function Cancel,
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
          'CANCEL',
          textAlign: TextAlign.center,
          style: TextStyle(
            //After pressing the button "Add" the data will be added to the list
              fontSize: 28.0,
              color: Colors.pinkAccent.withOpacity(0.7),
              fontStyle: FontStyle.italic,
              fontFamily: 'DMMono'),
        ),
        onPressed:Cancel
        ,
      ),
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
Widget ShiftDialog({int index,TodoblocBloc todoBloc,Todo entry,BuildContext context})
{ CalendarController controller=CalendarController();


  return AlertDialog(
    backgroundColor: Colors.white70.withOpacity(0.7),
    title: Text('Shift TODO',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 28.0,
          color: Colors.teal[400].withOpacity(0.7),
          fontStyle: FontStyle.italic,
          fontFamily: 'DMMono'),
        ),
    content: TableCalendar(
      calendarController: controller,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
          formatButtonShowsNext: false,
          centerHeaderTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 12.0,
              fontFamily: 'RobotoSlab',
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[600]

          ),
          decoration: BoxDecoration(color: Colors.white70.withOpacity(0.3))),
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle(
          color: Colors.teal[400],
          fontFamily: 'RobotoSlab',

          fontWeight: FontWeight.bold,
        ),
        selectedColor: Colors.amber[800],
        todayColor: Colors.redAccent,
        weekendStyle: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoSlab'
        ),
      ),
      initialCalendarFormat: CalendarFormat.month,

    ),
    actions: <Widget>[FlatButton(
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
        onPressed: (){
          Navigator.pop(context);
        }),
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
          onPressed: (){
            todoBloc.add(ShiftTodoEvent(entry: Todo(task: entry.title,
                completed: entry.completed,
                date:controller.selectedDay!=null?controller.selectedDay:entry.date,
                ),
                index:index,
                previousDate:entry.date,
            manager: manager));
            Navigator.pop(context);
            controller.dispose();
          })

    ],
  );

}