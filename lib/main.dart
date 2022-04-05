// ignore_for_file: unused_import, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unify_app/Tabs/Query/ask_query.dart';
import 'package:unify_app/Tabs/Query/list_query.dart';
import 'package:unify_app/Tabs/Query/query_submitted.dart';
import 'package:unify_app/Tabs/chats/chat_screen.dart';
import 'package:unify_app/drawer_manager/Syllabus.dart';
import 'package:unify_app/drawer_manager/assignment.dart';
import 'package:unify_app/drawer_manager/notice_board.dart';
import 'package:unify_app/drawer_manager/polling.dart';
import 'package:unify_app/drawer_manager/setting.dart';
import 'package:unify_app/drawer_manager/userprofile.dart';
import 'package:unify_app/pages/forgot_page.dart';
import 'package:unify_app/pages/login_page.dart';
import 'package:unify_app/pages/main_page.dart';
import 'package:unify_app/pages/roughpage.dart';
import 'package:unify_app/pages/splash_screen.dart';
import 'package:unify_app/utils/routes.dart';
import 'package:unify_app/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Tabs/calander/calender.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoMonoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        darkTheme: darkThemeData(context),
        initialRoute: MyRoutes.splashroutes,
        home: Calendar(),
        routes: {
          "/splash": (context) => SplashScreen(),
          MyRoutes.loginroutes: (context) => LoginPage(),
          MyRoutes.splashroutes: (context) => SplashScreen(),
          MyRoutes.forgotroutes: (context) => ForgotPassword(),
          MyRoutes.mainpageroutes: (context) => MainPage(),
          MyRoutes.assignmentroutes: (context) => Assignment(),
          MyRoutes.noticeboardroutes: (context) => NoticeBoard(),
          MyRoutes.pollingroutes: (context) => Polling(),
          MyRoutes.settingroutes: (context) => Setting(),
          MyRoutes.syllabusroutes: (context) => Syllabus(),
          MyRoutes.chatroutes: (context) => ChatScreen(),
          MyRoutes.calendarroutes: (context) => Calendar(),
          MyRoutes.askqueryroutes: (context) => AskQuery(),
          MyRoutes.listqueryroutes: (context) => ListQueries(),
          MyRoutes.querySubmittedroutes: (context) => QuerySubmitted(),
          MyRoutes.userProfileroutes: (context) => UserProfile(),
        },
      );
}
