// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PeriNavBar extends StatelessWidget {
  const PeriNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Image(image: AssetImage('assets/images/peri_logo_nav.png')),
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
      actions: [Image(image: AssetImage('assets/images/user_peri_nav.png'))],
    );
  }
}
