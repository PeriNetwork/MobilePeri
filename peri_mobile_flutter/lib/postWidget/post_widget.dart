// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:like_button/like_button.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20),
      alignment: Alignment.topCenter,
      width: 0.8 * (MediaQuery.of(context).size.width),
      height: 0.3 * (MediaQuery.of(context).size.height),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 43, 43, 43)),
      child: Column(
        children: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/images/peri_logo_nav.png'),
                width: 0.1 * (MediaQuery.of(context).size.width),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Peri Social Network",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'Inter',
                    fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  LikeButton(
                    size: 30,
                    padding: EdgeInsets.all(5),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.comment,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Image(
                  image: AssetImage('assets/images/post_media_2.png'),
                  width: 0.5 * (MediaQuery.of(context).size.width),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
