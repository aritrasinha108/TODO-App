import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  double height;
  MyAppBar({Key key, this.height})
      : super(key: key); //Taking height  as argument



  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //So that the widget covers the whole screen width
      children: <Widget>[
        Container(

          child: Card(
              color: Colors.white.withOpacity(0.7),
              elevation: 14.0,
              child: Column(

                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(

                      decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.4),
                          //Reducing opacity

                          border: Border.all(
                            width: 1.5,
                            color: Colors.teal[400].withOpacity(0.4),
                          )),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(12.0, 1.0, 1.0, 1.0),
                            child: Row(
                              //This row includes the app icon and the Name of  the app
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: //Using Circle Avatar for viewing the widget
                                      AssetImage(
                                          'assets/secretary.jpg'), //App Icon
                                  backgroundColor: Colors.blueAccent[330],
                                  radius: 30.0, //Size of the icon
                                ),
                                SizedBox(
                                  //To separate the app name and the icon
                                  width: 20.0,
                                ),
                                Text(
                                  'The Secretary', //App Name
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoSlab',
                                    fontSize: 30.0,

                                    color: Colors.teal[400],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            //To separate the two rows
                            height: 14.0,
                          ),
                        ],
                      ),
                    ),
                  ])),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(height); //Used by the appbar for height
}
