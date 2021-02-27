import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mesh_app_social/splashpage.dart';

void main() {

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async{
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Always keep the portrait mode of device
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('de', 'DE'),
      ],
      home: Splashpage(),
    );
  }
}