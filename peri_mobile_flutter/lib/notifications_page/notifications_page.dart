// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../peri_nav_bar.dart';
import 'notification_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(1, 1),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Align(
          alignment: Alignment(0, -1),
          child: Column(children: [
            NotificationWidget(
              notificationType: Icons.thumb_up,
              userName: "Joaozinho",
            ),
            NotificationWidget(
                notificationType: Icons.comment, userName: "Felipe Furlani")
          ]),
        )),
        appBar: PreferredSize(
            child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
      ),
    );
  }
}
