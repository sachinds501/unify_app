import 'package:flutter/material.dart';
import 'package:unify_app/pages/login_page.dart';

// ignore_for_file: prefer_const_constructors
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/splash.gif",
                    width: 450,
                    height: 450,
                  ),
                ),
              ],
            )));
  }
}
