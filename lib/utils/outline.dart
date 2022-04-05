// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:unify_app/utils/themes.dart';

// ignore_for_file: prefer_const_constructors
class OutlineItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String code;
  // ignore: use_key_in_widget_constructors
  const OutlineItem({required this.name, required this.imageUrl, required this.code});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 90,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                '$imageUrl',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '$code',
                        style: greyTextStyle.copyWith(fontSize: 15),
                      ),
                    ],
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
