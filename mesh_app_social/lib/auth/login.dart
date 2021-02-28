import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:http/http.dart';
import 'package:mesh_app_social/auth/name.dart';

import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future _makePutRequest() async {
    // set up PUT request arguments
    try {
      String url =
          'http://teamy.eu-de.mybluemix.net/api/register?email=$mail&password=$password';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{}'; // make PUT request
      print(url);
      Response response = await post(url,
          headers: headers, body: json); // check the status code for the result
      int statusCode = response
          .statusCode; // this API passes back the updated item with the id added
      if (statusCode == 200) {
        // make GET request
        String url2 =
            'http://teamy.eu-de.mybluemix.net/api/token?username=$mail&password=$password';
        print(url2);
        Response response2 =
            await post(url2); // sample info available in response
        int statusCode2 = response2.statusCode;
        if (statusCode2 == 200) {
          Map<String, String> headers2 = response2.headers;
          String contentType2 = headers2['content-type'];
          Map json2 =
              jsonDecode(response2.body); // TODO convert json to object...
          MyApp.prefs.setString("access_Token", json2["access_Token"]);
          MyApp.prefs.setString("userName", json2["userName"]);
          print(json2["access_Token"]);
          print(json2["userName"]);
          print("Put successful");
          return true;
        }
        print(statusCode2);
        return false;
      } else {
        print(statusCode);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  _getButton({String text, Function fn, colors}) {
    double borderRadius = 999;

    return Center(
      child: GestureDetector(
        //TODO: Change to
        // onTap: fn,
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Name()));
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
            )),
          ),
        ),
      ),
    );
  }

  String mail;
  String password;

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
        resizeToAvoidBottomPadding: false,
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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _getButton(text: "Login with Google", fn: () {}, colors: [
                      Colors.red.withOpacity(0.7),
                      Colors.red.withOpacity(0.5)
                    ]),
                    _getButton(
                      text: "Login with Apple",
                      fn: () {},
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    _getButton(text: "Einloggen", fn: () {}, colors: [
                      Colors.blue.withOpacity(0.7),
                      Colors.blue.withOpacity(0.5)
                    ]),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, a, b) => AlertDialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            // title: Center(
                            //     child: Text(
                            //   "Registrieren",
                            //   style: TextStyle(color: Colors.white, fontSize: 14),
                            // )),
                            content: GlassmorphicContainer(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.5,
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
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Registrieren",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    TextField(
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        hintText: "E-Mail",
                                        hintStyle:
                                            TextStyle(color: Colors.white54),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                      autofocus: true,
                                      onChanged: (val1) {
                                        setState(() {
                                          mail = val1;
                                        });
                                      },
                                    ),
                                    TextField(
                                      selectionWidthStyle: BoxWidthStyle.max,
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.black,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Passwort",
                                        hintStyle:
                                            TextStyle(color: Colors.white54),
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                      autofocus: true,
                                      onChanged: (val2) {
                                        setState(() {
                                          password = val2;
                                        });
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          child: Text(
                                            "Zurück",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              mail = null;
                                              password = null;
                                            });
                                            Navigator.pop(context);
                                          },
                                        ),
                                        GestureDetector(
                                          child: Text(
                                            "Weiter",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onTap: () {
                                            _makePutRequest().then((value) =>
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Name())));
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      opaque: false));
                },
                child: Text(
                  "Registrieren",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
