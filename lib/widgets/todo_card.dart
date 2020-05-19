import 'package:aritrairis2020/notifications/notifications.dart';
import '../bloc/todobloc_bloc.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'dialog.dart';

Widget TodoCard({
  TextEditingController controller,
  DateTime selectedDate,
  Todo entry,
  int index,
  TodoblocBloc todoBloc,
  BuildContext context,
  NotificationManager manager
}) {
  return Container(
    margin: EdgeInsets.all(0.0),
    width: double.infinity,
    height: 200.0,
    decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    //Adding a Card to display the data
    child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side:
            BorderSide(width: 2.0, color: Colors.white70.withOpacity(0.5))),
        color: Colors.white70.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,3.0,1.0,1.0),
              child: Text(
                entry.title, // Displaying the data
                style: TextStyle(
                  fontFamily: 'DMMono',
                  fontSize: 20.0,
                  //Fonts downloaded from Google fonts
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withOpacity(0.7),

                ),
              ),
            ),
            CompletedText(entry.completed),
            Row(
              //This row includes the buttons which provide the option to delete and update data
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  //Update Button
                  onPressed: () {
                    showDialog(
                      //Dialog here uses the entered data to overwrite the existing value of data
                        context: context,
                        builder: (BuildContext context) {
                          return DialogBox(
                              Title: "Update TODO",
                              controller: controller,
                              Manipulation: () {
                                todoBloc.add(
                                    EditTodoEvent(
                                        index: index,
                                        entry: Todo(
                                            date: entry.date,
                                            completed: entry.completed,
                                            task: controller.text),
                                    manager: manager));
                                Navigator.pop(context);
                              },
                          Cancel: (){
                                Navigator.pop(context);
                          });
                        });
                  },
                  icon: Icon(
                    //Refresh icon is added
                    Icons.refresh,
                    color: Colors.teal[400],
                    size: 40.0,
                  ),
                  iconSize: 40.0,
                ),

                IconButton(
                  //Delete button
                  iconSize: 40.0,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.teal[400],
                    size: 40.0,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteOrCompleteDialog(
                            Title: 'Delete Todo',
                              Body: 'Are you sure you want to delete the TODO?',
                              Cancel: () {
                                Navigator.pop(
                                    context); //Doing nothing but coming out of the dialog box
                              },
                              Confirm: () {
                                todoBloc.add(DeleteTodoEvent(index:index,entry:entry,manager:manager));
                                Navigator.pop(context);
                              },
                              todoBloc: todoBloc);
                        });
                  },
                ),
                RaisedButton(
                  //Delete button

                  child: Text('Complete',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.teal[400],
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteOrCompleteDialog(
                              Title: 'Complete TODO',
                              Body: 'Are you sure you want to complete the todo?',
                              Cancel: () {
                                Navigator.pop(
                                    context); //Doing nothing but coming out of the dialog box
                              },
                              Confirm: () {
                                todoBloc.add(CompleteTodoEvent(index:index,entry:entry,manager: manager));
                                Navigator.pop(context);
                              },
                              todoBloc: todoBloc);
                        });
                  },
                )
              ],
            ),
          ],
        )),
  );
}
Widget CompletedText(bool complete)
{
  if(complete)
    return Text("Completed",
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.green[900],
      fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
    ),);
  else
    return Text("Pending",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red[900],
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
      ),);

}
