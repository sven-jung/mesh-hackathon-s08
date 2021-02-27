import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/auth/name.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  _getButton({String text, Function fn, colors}) {
    double borderRadius = 999;

    return Center(
      child: GestureDetector(
        //TODO: Change to
        // onTap: fn,
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Name()
          ));
        },
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
            height: MediaQuery.of(context).size.height*0.1,
            border: 1,
            blur: 50,
            linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
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
              )
            ),
          ),
        ),
      ),
    );
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
            ]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _getButton(
                      text: "Login with Google",
                      fn: () {},
                      colors: [
                        Colors.red.withOpacity(0.7),
                        Colors.red.withOpacity(0.5)
                      ]
                    ),
                    _getButton(
                      text: "Login with Apple",
                      fn: () {},
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                    Divider(color: Colors.white,),
                    _getButton(
                      text: "Einloggen",
                      fn: () {},
                      colors: [
                        Colors.blue.withOpacity(0.7),
                        Colors.blue.withOpacity(0.5)
                      ]
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Registrieren",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
