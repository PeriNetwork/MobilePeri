// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/UserProfile/user_profile.dart';
import 'package:peri_mobile_flutter/configPage/config_page.dart';
import 'package:peri_mobile_flutter/home_page.dart';
import 'package:peri_mobile_flutter/notifications_page/notifications_page.dart';
import 'package:peri_mobile_flutter/sign_in/create_account/create_account.dart';
import 'package:peri_mobile_flutter/sign_in/login/login_page.dart';
import 'package:peri_mobile_flutter/sign_in/sign_in.dart';
import 'package:peri_mobile_flutter/write_post_page/write_post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPeri(),
        '/homepage': (context) => HomePagePeri(),
        '/notifications': (context) => NotificationsPage(),
        //'/myprofile': (context) => UserProfile(periPostRepository: ),
        '/writePost': (context) => WritePostPage(),
        '/createAccount': (context) => CreateAccountPage(),
        '/login': (context) => LoginPage(),
        '/config': (context) => configUserPage(),
      },
      title: 'Peri',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
