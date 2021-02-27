import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/chat/in_chat.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {

  List<Map> chatsList = [
    {
      "name": "Elon Musk",
      "photo": "assets/elon_musk.jpg",
    },
    {
      "name": "Jan Engbert",
      "photo": "assets/jan.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double borderRadius = 20;

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              "Deine Matches",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: chatsList.isNotEmpty ? chatsList.length : 1,
            itemBuilder: (BuildContext context, int index) {
              if(chatsList.isEmpty) {
                return Center(
                  child: Text(
                    "Du hast leider noch keine Matches.",
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                return ListTile(
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(999)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.orange[100],
                              Colors.orange[900]
                            ],
                          ),
                        ),
                        child: Center()
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(chatsList[index]["photo"]),
                      ),
                    ],
                  ),
                  title: Text(
                    "Du hast ein Match mit",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                    ),
                  ),
                  subtitle: Text(
                    chatsList[index]["name"],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: 20
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder:
                            (context) => InChatView(
                                name: chatsList[index]["name"],
                                picURL: chatsList[index]["photo"])));
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
