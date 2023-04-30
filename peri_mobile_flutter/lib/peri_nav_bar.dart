// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/UserProfile/user_profile.dart';

class PeriNavBar extends StatelessWidget {
  const PeriNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image(image: AssetImage('assets/images/peri_logo_nav.png')),
      ),
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
      title: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/bell_peri_nav.png')),
            SizedBox(
              width: 15,
            ),
            Image(image: AssetImage('assets/images/create_peri_nav.png')),
            SizedBox(
              width: 15,
            ),
            Image(image: AssetImage('assets/images/search_peri_nav.png')),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const UserProfile();
            }));
          },
          child: Image(
            image: AssetImage(
              'assets/images/user_peri_nav.png',
            ),
          ),
        )
      ],
    );
  }
}
