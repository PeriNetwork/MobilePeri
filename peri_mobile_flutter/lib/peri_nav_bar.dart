// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/UserProfile/user_profile.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_post_repository.dart';
import 'package:peri_mobile_flutter/home_page.dart';
import 'package:peri_mobile_flutter/notifications_page/notifications_page.dart';

class PeriNavBar extends StatelessWidget {
  const PeriNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final listUserPosts = PeriPostRepository();
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePagePeri()),
          );
        },
        child: Image(image: AssetImage('assets/images/peri_logo_nav.png')),
      ),
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
      title: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const NotificationsPage();
                }));
              },
              child:
                  Image(image: AssetImage('assets/images/bell_peri_nav.png')),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserProfile(periPostRepository: listUserPosts);
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
