import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/auth/type.dart';

import '../main.dart';

class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {

  String name = '';

  @override
  Widget build(BuildContext context) {

    double borderRadius = 20;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF456b9d),
              Color(0xFF1d3557),
            ]
        ),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: Text(MyApp.appName, textAlign: TextAlign.center,),
          ),
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),),
                ],
              ),
              child: GlassmorphicContainer(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.7,
                border: 2,
                blur: 50,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.125),
                      Colors.white.withOpacity(0.15),
                    ]
                ),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                borderRadius: borderRadius,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        height: MediaQuery.of(context).size.height*0.6,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Wie ist dein Name?",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                            ),
                            TextField(
                              selectionWidthStyle: BoxWidthStyle.max,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              autofocus: true,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    name == '' ? Center() : GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Type()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(25),
                        height: 30,
                        child: Text(
                          "Weiter",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
