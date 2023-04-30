// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile(
      {super.key,
      required this.userName,
      required this.followersNumber,
      required this.followingNumber});

  final String userName;
  final int followersNumber;
  final int followingNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 100,
          ),
        ),
        Text(
          userName,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "$followingNumber Seguindo | $followersNumber Seguidores",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
