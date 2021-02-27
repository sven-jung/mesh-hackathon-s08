import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart';
import 'package:mesh_app_social/auth/skills.dart';
import 'package:mesh_app_social/main.dart';

class LookingFor extends StatefulWidget {
  final bool isInvestor;

  LookingFor({this.isInvestor});

  @override
  _LookingForState createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
  @override
  void initState() {
    super.initState();
  }

  _getButton({String text, Function fn}) {
    double borderRadius = 20;

    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Center(
        child: GestureDetector(
          //TODO: Change to
          // onTap: fn,
          onTap: () {
            fn();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Skills(isInvestor: widget.isInvestor)),
              (Route<dynamic> route) => false,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: GlassmorphicContainer(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              border: 1,
              blur: 50,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.transparent.withOpacity(0.1),
                  Colors.transparent.withOpacity(0.2),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color(0xFFFFFFFF).withOpacity(0.5),
                ],
              ),
              borderRadius: borderRadius,
              child: Center(
                  child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _listButtons() {
    if (widget.isInvestor) {
      return <String>["StartUps", "Partner"];
    } else {
      return <String>["Partner", "Investoren", "Ideen"];
    }
  }

  List<Widget> _getButtons() {
    List<Widget> widgets = <Widget>[];
    _listButtons().forEach((element) {
      widgets.add(_getButton(
        text: "Ich suche " + element,
        fn: () {
          MyApp.prefs.setString("LookingFor", element);
        },
      ));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF456b9d),
              Color(0xFF1d3557),
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          title: Text(
            MyApp.appName,
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meine Präferenz\n\n",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _getButtons(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
