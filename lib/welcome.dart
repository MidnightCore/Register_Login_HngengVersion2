import 'package:flutter/material.dart';
import 'game_page.dart';
import 'profile.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final formKey = GlobalKey<FormState>();
  String emailString, passwordString, nicknameString;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 130.0, 0.0, 0.0),
                        child: Text(
                          'SSRU GO',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 220.0, 0.0, 0.0),
                        child: Text(
                          'New Generation',
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 270.0, 0.0, 0.0),
                        child: Text(
                          'of Learning',
                          style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 310.0, 0.0, 0.0),
                        child: Text(
                          'GE',
                          style: TextStyle(
                              fontSize: 75.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900]),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(110.0, 310.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 75.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 70.0),
                        Container(
                            height: 60.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.pinkAccent,
                              color: Colors.pink,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              GamePage()));
                                },
                                child: Center(
                                  child: Text(
                                    'Start Game',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        Container(
                          height: 40.0,
                          color: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Center(
                                child: Text('Back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ]),
        ));
  }
}
