import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

class InChatView extends StatefulWidget {

  String name;
  String picURL;

  InChatView({@required this.name, @required this.picURL});

  @override
  _InChatViewState createState() => _InChatViewState();
}

class _InChatViewState extends State<InChatView> {

  List<ChatMessage> messages = <ChatMessage>[];

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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.orange[700],
            shadowColor: Colors.transparent,
            title: Text(widget.name, textAlign: TextAlign.center,),
          ),
          backgroundColor: Colors.transparent,
          body: DashChat(
            messages: messages,
            user: ChatUser(
              name: widget.name,
              uid: "xxxxxxxxxxxxx",
              avatar: widget.picURL,
            ),
            onSend: (message) {
              setState(() {
                messages.add(message);
              });
            },
          ),
        ),
      ),
    );
  }
}
