import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart';
import 'package:mesh_app_social/matching/filter_matches.dart';

class MatchingView extends StatefulWidget {
  @override
  _MatchingViewState createState() => _MatchingViewState();
}

class _MatchingViewState extends State<MatchingView> {
  _makeGetRequest({String params = ""}) async {
    // make GET request
    try {
      String url = 'http://teamy.eu-de.mybluemix.net/api/swipe/cards?$params';
      Response response = await get(url); // sample info available in response
      int statusCode = response.statusCode;
      Map<String, String> headers = response.headers;
      String contentType = headers['content-type'];
      setState(() {
        json = jsonDecode(response.body);
      });
    } catch (e) {
      setState(() {
        json = {};
      });
    }
  }

  bool filtering = false;

  @override
  void setState(fn) {
    if(this.mounted) {
      super.setState(fn);
    }
  }

  Map json;

  List<Map> fallback = [
    {
      "name": "Matthias Schwarz",
      "maintag": "#BARMERChallenge",
      "descr": "Wir suchen nach innovativen Ideen, wie wir StartUps leichter erreichen können.\nBewerben mit #DinoTrifftEinhorn",
      "needtags": ["#StartUp", "#Idee"],
      "pic": "assets/matthias.png"
    },
    {
      "name": "Enes Baskal",
      "maintag": "#BARMER",
      "descr": "Wir suchen Startups, die Lust haben, BARMER bei Gesundheitspolitik zu unterstützen\nBewerben mit #GPChallenge",
      "needtags": ["#StartUp", "#Idee"],
      "pic": "assets/enes.png"
    },
    {
      "name": "Jan Engbert",
      "maintag": "#RedBullStartup",
      "descr": "MESH braucht mehr RedBull. Ich brauche Ünterstützung!",
      "needtags": ["#StrongMan", "#RedBull"],
      "pic": "assets/jan_mesh_red_bull.jpg"
    },
    {
      "name": "Teamy",
      "maintag": "#StartUp",
      "descr": "Wir sind die Plattform, wo StartUps und Partner zusammentreffen.",
      "needtags": ["#Investor", "#BARMER"],
      "pic": "assets/teamy_card.png"
    },
    {
      "name": "MESH",
      "maintag": "#MESH",
      "descr": "Wir sind ein Hackathon für innovative StartUps. Bewerben mit #MESHAccepted",
      "needtags": ["#StartUp", "#Idee"],
      "pic": "assets/mesh_card.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    _makeGetRequest();
  }

  _filter() {
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, a, b) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(24))),
            content: GlassmorphicContainer(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              border: 1,
              blur: 10,
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
              borderRadius: 24,
              child: FilterMatches(
                filterFn: (String args) {
                  if(args == null || args.isEmpty) {
                    // close popup
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context);
                    setState(() {filtering = true;});
                    _makeGetRequest(params: args);
                    Future.delayed(Duration(seconds: 3)).then((value) {
                      setState(() {filtering = false;});
                    });
                  }
                },
              ),
            ),
          ),
        ),
        opaque: false));
  }

  @override
  Widget build(BuildContext context) {
    double borderRadius = 20;
    CardController controller;

    return json == null ? Center(child: CupertinoActivityIndicator(),) : Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(50),
          child: Center(
            child: Text(
              "Momentan sind leider keine weiteren Einträge vorhanden.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.replay,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: _filter,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: TinderSwapCard(
                    swipeUp: true,
                    swipeDown: true,
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: json["cards"] != null  ? json["cards"].length : 5,
                    stackNum: 3,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width * 0.8 + 1,
                    maxHeight: MediaQuery.of(context).size.height * 0.75 + 1,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    minHeight: MediaQuery.of(context).size.height * 0.75,
                    cardBuilder: (context, index) {
                      return Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(borderRadius)),
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
                            height: MediaQuery.of(context).size.height * 0.75,
                            border: 2,
                            blur: 50,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.1),
                                ]),
                            borderGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFffffff).withOpacity(0.5),
                                Color((0xFFFFFFFF)).withOpacity(0.5),
                              ],
                            ),
                            borderRadius: borderRadius,
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                      child: json["cards"] != null && json["cards"][index] != null && json["cards"][index]["pic"] != null
                                          ? Image.memory(json["cards"][index]["pic"]) : Image.asset(fallback[index]["pic"]),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          json["cards"] != null && json["cards"][index] != null && json["cards"][index]["name"] != null
                                              ? json["cards"][index]["name"] : fallback[index]["name"],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color(0xFF1d3557),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(999)),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.red.withOpacity(0.7),
                                                Colors.red.withOpacity(0.5),
                                              ],
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Text(
                                            json["cards"] != null && json["cards"][index] != null && json["cards"][index]["maintag"] != null
                                                ? json["cards"][index]["maintag"] : fallback[index]["maintag"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text(
                                      json["cards"] != null && json["cards"][index] != null && json["cards"][index]["descr"] != null
                                          ? json["cards"][index]["descr"] :
                                      fallback[index]["descr"],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "\nIch suche:",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color(0xFF1d3557),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.all(5)),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(999)),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.green.withOpacity(0.7),
                                                Colors.green.withOpacity(0.5),
                                              ],
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Text(
                                            json["cards"] != null && json["cards"][index] != null && json["cards"][index]["tags"] != null && json["cards"][index]["tags"][0] != null
                                                ? "#" + json["cards"][index]["tags"][0]
                                                : fallback[index]["needtags"][0],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(2.5)),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(999)),
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.blue.withOpacity(0.7),
                                                Colors.blue.withOpacity(0.5),
                                              ],
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 2),
                                          child: Text(
                                            json["cards"] != null && json["cards"][index] != null && json["cards"][index]["tags"] != null && json["cards"][index]["tags"][1] != null
                                                ? "#" + json["cards"][index]["tags"][1]
                                                : fallback[index]["needtags"][1],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    cardController: controller = CardController(),
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      if (align.x < 0) {
                        //TODO: LEFT
                      } else if (align.x > 0) {
                        //TODO: RIGHT
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      // Get orientation and index of swiped card
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        filtering ? CupertinoActivityIndicator(radius: 75,) : Center(),
      ],
    );
  }
}
