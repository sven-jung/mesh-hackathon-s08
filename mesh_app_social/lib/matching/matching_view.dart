import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MatchingView extends StatefulWidget {
  @override
  _MatchingViewState createState() => _MatchingViewState();
}

class _MatchingViewState extends State<MatchingView> {

  List cardsList = [
    "a",
    "a",
    "a",
    "a",
    "a",
  ];

  @override
  Widget build(BuildContext context) {

    double borderRadius = 20;
    CardController controller;

    return Stack(
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
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.9,
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.8,
                child: Center(
                  child: TinderSwapCard(
                    swipeUp: true,
                    swipeDown: true,
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: cardsList.length,
                    stackNum: 3,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width*0.8 + 1,
                    maxHeight: MediaQuery.of(context).size.height*0.75 + 1,
                    minWidth: MediaQuery.of(context).size.width*0.8,
                    minHeight: MediaQuery.of(context).size.height*0.75,
                    cardBuilder: (context, index) {
                      return Center(
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
                            width: MediaQuery.of(context).size.width*0.8,
                            height: MediaQuery.of(context).size.height*0.75,
                            border: 2,
                            blur: 50,
                            linearGradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.1),
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
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.7,
                                height: MediaQuery.of(context).size.height*0.7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/mesh.png"),
                                    Image.asset("assets/huk.png"),
                                    Image.asset("assets/barmer.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    cardController: controller = CardController(),
                    swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
                      if(align.x < 0) {
                        //TODO: LEFT
                      } else if(align.x > 0) {
                        //TODO: RIGHT
                      }
                    },
                    swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
                      // Get orientation and index of swiped card
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
