// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/UserProfile/user_profile.dart';
import 'package:peri_mobile_flutter/create_post.dart';
import 'package:peri_mobile_flutter/home_page.dart';
import 'package:peri_mobile_flutter/notifications_page/notifications_page.dart';
import 'package:peri_mobile_flutter/postWidget/post_widget.dart';
import 'package:peri_mobile_flutter/search_bar.dart';
import 'package:peri_mobile_flutter/sign_in/sign_in.dart';
import 'package:peri_mobile_flutter/write_post_page/write_post_page.dart';
import 'peri_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => SignInPeri(),
          '/homepage': (context) => HomePagePeri(),
          '/notifications': (context) => NotificationsPage(),
          '/myprofile': (context) => UserProfile(),
          '/writePost':(context) => WritePostPage()
        },
        debugShowCheckedModeBanner: false,
        title: 'Peri',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        );
  }
}
