import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/auth/looking_for.dart';


///
/// Investor oder Gründer
///

class Type extends StatefulWidget {
  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  @override
  Widget build(BuildContext context) {

    double borderRadius = 20;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3494E6),
              Color(0xFFEC6EAD),
            ]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ich bin...",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LookingFor()));
                  },
                  child: GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.35,
                    border: 2,
                    blur: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.5),
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
                      child: Text(
                        "GRÜNDER",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                
                Padding(padding: EdgeInsets.all(20)),
                
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LookingFor()));
                  },
                  child: GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.35,
                    border: 2,
                    blur: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.5),
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
                      child: Text(
                        "INVESTOR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
