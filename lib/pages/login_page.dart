// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unify_app/pages/main_page.dart';
import 'package:unify_app/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// import 'main_page.dart';
// ignore_for_file: prefer_const_constructors
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.gif",
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 25, 116, 190),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  width: 200,
                  height: 70,
                  child: Center(
                    child: Text(
                      "Welcome to",
                      style: GoogleFonts.robotoMono(
                        textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/AppIcon.png",
                height: 70,
              ),
              SizedBox(
                height: 20,
              ),
              _typer(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.mail,
                                color: Color.fromARGB(255, 25, 116, 190),
                              ),
                            ),
                            labelText: 'Username',
                          ),
                          onSaved: (value) {
                            emailTextEditingController.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.lock,
                                  color: Color.fromARGB(255, 25, 116, 190),
                                ),
                              ),
                              labelText: 'Password',
                            ),
                            onSaved: (value) {
                              passwordTextEditingController.text = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password cannot be empty";
                              } else if (value.length < 8) {
                                return "Password must have atleast 8 characters";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () => Navigator.pushNamed(
                              context, MyRoutes.forgotroutes),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 25, 116, 190),
                              onPrimary: Colors.white,
                              minimumSize: Size(200, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                          icon: FaIcon(FontAwesomeIcons.lock),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              _signIn();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            }
                          },
                          label: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 152,
              ),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Team VSR x",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    TextSpan(
                        text: '2021',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 116, 190),
                            fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  //Firebase Authentication from Email Id and Password

  bool accountExistinDatabase = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _signIn() async {
    try {
      final User? newUser = (await _firebaseAuth
              .signInWithEmailAndPassword(
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text)
              .catchError((errMsg) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Error: " + errMsg.toString()),
        ));
      }))
          .user;

      if (newUser != null)
      //checking in database for user imformation so data cant be overlapped.
      {
        final user = FirebaseAuth.instance.currentUser;
        final userId = user!.uid;

        /*Firestore*/
        // String uid = _firebaseAuth.currentUser!.uid.toString();
        // users.add({'uid': uid});
        // users.add({'email': emailTextEditingController});

        var userData = {
          'uid': user.uid,
          'provider': 'email',
          'photoUrl': user.photoURL,
          'email': emailTextEditingController.text,
        };

        users.doc(userId).get().then(
          (doc) {
            if (doc.exists) {
              // old user
              doc.reference.update(userData);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Login Successful"),
              ));
            } else {
              // new user
              users.doc(user.uid).set(userData);

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            }
          },
        );
      }
    } catch (e) {
      print(e);
      print("Sign in not successful !");
      // better show an alert here
    }
  }

  Widget _typer() {
    return SizedBox(
      width: 280.0,
      child: DefaultTextStyle(
        style: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 71, 55, 55),
          ),
        ),
        child: AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
          // TyperAnimatedText('Welcome to Unify app,',
          //     speed: Duration(milliseconds: 100)),
          TyperAnimatedText('Login with your institute credentials into,',
              speed: Duration(milliseconds: 100)),
          TyperAnimatedText('The finest medium of interaction between,',
              speed: Duration(milliseconds: 100)),
          TyperAnimatedText('Faculty and Students,',
              speed: Duration(milliseconds: 100)),
          TyperAnimatedText('with multi features app, "Unify".',
              speed: Duration(milliseconds: 100)),
        ]),
      ),
    );
  }
}
