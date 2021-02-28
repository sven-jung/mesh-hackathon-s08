import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mesh_app_social/splashpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String appName = "Teamy";
  static SharedPreferences prefs;

  _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // Always keep the portrait mode of device
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _initSharedPreferences();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashpage(),
    );
  }
}
