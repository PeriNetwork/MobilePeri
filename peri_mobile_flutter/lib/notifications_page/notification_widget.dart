// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {super.key, required this.notificationType, required this.userName});

  final IconData notificationType;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1 * (MediaQuery.of(context).size.height),
      width: 0.8 * (MediaQuery.of(context).size.width),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              notificationType,
              color: Colors.red,
              size: 35,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                notificationType == Icons.thumb_up
                    ? "Curtiu seu post"
                    : "Adicionou um comentário",
                style:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
