// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../peri_nav_bar.dart';

class WritePostPage extends StatelessWidget {
  const WritePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                Image(image: AssetImage('assets/images/user_peri_nav.png'))
              ],
            ),
            Column(children: [
              TextField(
                //decoration: ,
              )
            ],)
          ],
        ),
      ),
    );
  }
}
