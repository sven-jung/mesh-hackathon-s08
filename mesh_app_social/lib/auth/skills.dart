import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/frame.dart';
import 'package:mesh_app_social/main.dart';

class Skills extends StatefulWidget {

  bool isInvestor;
  static String firstHashtag = '';

  Skills({@required bool isInvestor}) {
    this.isInvestor = isInvestor;
    Skills.firstHashtag = isInvestor ? "Investor" : "Gründer";
  }

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {

  List<String> hashtags = [
    Skills.firstHashtag,
  ];


  List<Widget> _getHashtags() {
    List<Widget> widgets = <Widget>[];
    hashtags.forEach((element) {
      TextEditingController c = TextEditingController();
      c.text = element;
      widgets.add(
        Row(
          children: [
            Text(
              '#',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 20)),
            Container(
              width: MediaQuery.of(context).size.width*0.55,
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    hashtags[hashtags.indexOf(element)] = val;
                  });
                },
                controller: c,
                cursorColor: Colors.white,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            IconButton(icon: Icon(Icons.close, color: Colors.white,), onPressed: () {
              setState(() {
                hashtags.remove(element);
              });
            }),
          ],
        )
      );
    });
    return widgets;
  }

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
                height: MediaQuery.of(context).size.height*0.85,
                border: 2,
                blur: 50,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.125),
                      Colors.white.withOpacity(0.15),
                    ],
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      child: Column(
                        children: [
                          Text(
                            "\nMein Skillset\n",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _getHashtags(),
                          ),
                          Center(
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.white,),
                              onPressed: () {
                                setState(() {
                                  hashtags.add("");
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Frame()));
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 20,),
                        height: 40,
                        child: Text(
                          "Weiter\n\n",
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
