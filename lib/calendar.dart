import 'package:aritrairis2020/bloc/todobloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//This is the table calendar widget used for displaying the calendar
Widget tabCalendar({CalendarController calendar,TodoblocBloc todoBloc}) {
  return Container(
    color: Colors.white70.withOpacity(0.5),
    child: TableCalendar(
      calendarController: calendar,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        formatButtonShowsNext: false,
          centerHeaderTitle: true,
          decoration: BoxDecoration(color: Colors.white70.withOpacity(0.6))),
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle(
          color: Colors.teal[400],

          fontWeight: FontWeight.bold,
        ),
        selectedColor: Colors.amber[800],
        todayColor: Colors.redAccent,
        weekendStyle: TextStyle(
          color: Colors.pinkAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
      initialCalendarFormat: CalendarFormat.month,
      onDaySelected: (date,events)
      {
        todoBloc.add(GetTodoEvent(date));   //If we change the selected day in the calendar the getTodo event is triggered
      }

      ,
    ),
  );
}
