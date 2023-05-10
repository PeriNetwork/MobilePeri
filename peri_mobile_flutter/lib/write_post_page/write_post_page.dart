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
        body: Column(
          
          children: [
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/user_peri_nav.png',
                        height: 50,
                      )
                    ],
                  ),
                  Container(
                    width: 0.8 * (MediaQuery.of(context).size.width),
                    decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(10)),
                    child: Expanded(
                        child: TextField(
                          minLines: 1,
                          maxLines: 10,
                      decoration: InputDecoration(
                        
                        border: OutlineInputBorder()
                      ), style: TextStyle(color: Colors.white),
                    )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
