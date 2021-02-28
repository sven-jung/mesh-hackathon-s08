import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mesh_app_social/chat/chat_view.dart';
import 'package:mesh_app_social/matching/matching_view.dart';
import 'package:mesh_app_social/profile/profile_view.dart';

import 'main.dart';

class Frame extends StatefulWidget {
  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> {

  PageController control = PageController(
    initialPage: 1,
    keepPage: true,
  );

  void bottomTapped(int index) {
    setState(() {
      // bottomSelectedIndex = index;
      // without setting it manually, it is set automatically
      // otherwise point is shown too early!!!
      control.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  int bottomSelectedIndex = 1;

  List<BottomNavigationBarItem> buildBottomNavBarItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Container(
          child: Icon(
            Icons.send,
            size: 35,
          ),
        ),
        label: 'Matches',
      ),
      BottomNavigationBarItem(
        icon: Container(
          child: Icon(
            Icons.repeat,
            size: 35,
          ),
        ),
        label: 'Finder',
      ),
      BottomNavigationBarItem(
        icon: Container(
          child: Icon(
            Icons.person,
            size: 35,
          ),
        ),
        label: 'Profile',
      ),
    ];
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: control,
      physics: new NeverScrollableScrollPhysics(),
      //scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        ChatView(),
        MatchingView(),
        ProfileView(),
      ],
    );
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
              Color(0xFF456b9d),
              Color(0xFF1d3557),
            ]
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFF456b9d),
              type: BottomNavigationBarType.fixed,
              currentIndex: bottomSelectedIndex,
              showUnselectedLabels: false,
              //macht title von Items unvisible
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              onTap: (index) {
                bottomTapped(index);
              },
              items: buildBottomNavBarItems(context),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: buildPageView(),
        ),
      ),
    );
  }
}
