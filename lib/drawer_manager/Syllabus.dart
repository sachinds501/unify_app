// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:unify_app/utils/outline.dart';
import 'package:unify_app/utils/themes.dart';
// ignore_for_file: prefer_const_constructors
class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  _SyllabusState createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // ignore: prefer_const_literals_to_create_immutables
                    colors: [
                      Color(0xffFFFBFB),
                      Color(0xffEEEEEE),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 100,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.indigo.shade800,
                            Colors.blue.shade500,
                          ],
                        ),
                        color: Colors.purple[900],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CHARUSAT UNIVERSITY',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/images/star.png',
                                          width: 25,
                                          height: 25,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          ' DEPSTAR',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 18),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          ' CSE',
                                          style: whiteTextStyle.copyWith(
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              OutlineItem(
                                imageUrl: 'assets/images/java.png',
                                name: 'Java Programming',
                                code: 'CE251',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/de.png',
                                name: 'Digital Electronics',
                                code: 'CE252',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/dcn.png',
                                name: 'Data Communication',
                                code: 'CE257',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/maths.png',
                                name: 'Discrete Mathematics',
                                code: 'MA253',
                              ),
                              OutlineItem(
                                imageUrl: 'assets/images/sgp.png',
                                name: 'Software Group Project -1',
                                code: 'CE244',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: edge,
                  vertical: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/images/btn_back.png',
                        width: 40,
                      ),
                    ),
                    Text(
                      ' SYLLABUS',
                      style: blackTextStyle.copyWith(fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Image.asset(
                        isClicked
                            ? 'assets/images/Heart1.png'
                            : 'assets/images/Heart.png',
                        width: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
