// ignore_for_file: use_key_in_widget_constructors, prefer_const_declarations, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unify_app/utils/routes.dart';

// ignore_for_file: prefer_const_constructors
class MyDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://w7.pngwing.com/pngs/971/990/png-transparent-computer-icons-login-person-user-pessoa-smiley-desktop-wallpaper-address-icon.png";
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: Container(
          color: Color.fromARGB(255, 25, 116, 190),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: UserAccountsDrawerHeader(
                    arrowColor: Color.fromARGB(255, 25, 116, 190),
                    margin: EdgeInsets.zero,
                    accountName: Text("Sachin"),
                    accountEmail: Text("${user!.email}"),
                    currentAccountPicture:
                        CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                    onDetailsPressed: () => Navigator.pushNamed(
                        context, MyRoutes.userProfileroutes)),
              ),
              Divider(
                color: Colors.black,
                indent: 10, // empty space to the leading edge of divider.
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text("Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              Divider(
                color: Colors.black,
                indent: 10, // empty space to the leading edge of divider.
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.news_solid,
                  color: Colors.white,
                ),
                title: Text("Notice Board",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.noticeboardroutes),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.number,
                  color: Colors.white,
                ),
                title: Text("Assignment",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.assignmentroutes),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.chart_bar_square,
                  color: Colors.white,
                ),
                title: Text("Polling",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.pollingroutes),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.book_fill,
                  color: Colors.white,
                ),
                title: Text("Syllabus",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.syllabusroutes),
              ),
              Divider(
                color: Colors.black,
                indent: 10, // empty space to the leading edge of divider.
                endIndent: 10,
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.settings,
                  color: Colors.white,
                ),
                title: Text("Settings",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () =>
                    Navigator.pushNamed(context, MyRoutes.settingroutes),
              ),
              ListTile(
                  leading: Icon(
                    CupertinoIcons.lock_open_fill,
                    color: Colors.white,
                  ),
                  title: Text("Logout",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.loginroutes);
                    _signingOut();
                  }),
                  Divider(
                color: Colors.black,
                indent: 10, // empty space to the leading edge of divider.
                endIndent: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signingOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
