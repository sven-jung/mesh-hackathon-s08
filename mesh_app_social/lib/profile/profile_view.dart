import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  _getButton({String text, Function fn, colors}) {
    double borderRadius = 999;

    return Center(
      child: GestureDetector(
        //TODO: Change to
        // onTap: fn,
        onTap: () {},
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
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.05,
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

  @override
  Widget build(BuildContext context) {
    double borderRadius = 20;

    return Center(
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
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
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
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30071999),
                        child: Image.asset(
                          "assets/jan.jpg",
                          width: MediaQuery.of(context).size.width * 0.40,
                        ),
                      ),
                      Text(
                        "Jan Engbert",
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        '# Redbull tragen\n# Mesh Meme Lord\n# Part-time \$GME shortseller\n# Founder of Stratton Oakmont',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      _getButton(text: "Meine Ideen", fn: () {}, colors: [
                        Colors.orange[700].withOpacity(0.7),
                        Colors.orange[700].withOpacity(0.5)
                      ]),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 35,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
