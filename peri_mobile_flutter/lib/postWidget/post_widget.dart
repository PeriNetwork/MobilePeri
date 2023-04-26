// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
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
                width: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Peri Social Network",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
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
                    size: 40,
                    padding: EdgeInsets.all(5),
                    
                  ),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
