// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:unify_app/utils/themes.dart';

// ignore_for_file: prefer_const_constructors
class OutlineItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String topic;
  OutlineItem({Key? key, 
    required this.name,
    required this.imageUrl,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 300,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xffFFFFFF),
              Color(0xffFFFFFF),
            ],
          ),
          color: Colors.purple[900],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$name',
                style: blackTextStyle.copyWith(
                  fontSize: 25,
                ),
              ),
              Image.asset(
                '$imageUrl',
                height: 200,
              ),
              Row(
                children: [
                  Text(
                    '$topic',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/next.jpg',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
