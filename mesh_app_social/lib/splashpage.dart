import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/auth/login.dart';
import 'package:mesh_app_social/frame.dart';

class Splashpage extends StatefulWidget {
  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {

  @override
  void initState() {
    super.initState();
    _navigateToRightPage();
  }

  _navigateToRightPage() async {
    Future.delayed(Duration(seconds: 3)).then((value) {
      bool userLoggedIn = false;

      if(userLoggedIn) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Frame()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
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
            child: GlassmorphicContainer(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.7,
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
                child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height*0.6,
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
        ),
      ),
    );
  }
}
