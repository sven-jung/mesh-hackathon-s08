import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  _navigateToRightPage() {
    bool userLoggedIn = true;

    if(userLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Frame()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
