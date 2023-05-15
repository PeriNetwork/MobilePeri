// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/UserProfile/user_profile.dart';
import 'package:peri_mobile_flutter/create_post.dart';
import 'package:peri_mobile_flutter/notifications_page/notifications_page.dart';
import 'package:peri_mobile_flutter/postWidget/post_widget.dart';
import 'package:peri_mobile_flutter/search_bar.dart';
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
          '/notifications': (context) => NotificationsPage(),
          '/myprofile': (context) => UserProfile(),
          '/writePost':(context) => WritePostPage()
        },
        debugShowCheckedModeBanner: false,
        title: 'Peri',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Align(
          alignment: Alignment(1, 1),
          child: Scaffold(
            appBar: PreferredSize(
                child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
            body: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -1),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      SearchBarPeri(),
                      PostWidget(),
                      PostWidget(),
                      PostWidget(),
                      PostWidget(),
                      PostWidget(),
                      PostWidget(),
                    ],
                  )),
                ),
                CreatePost(),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 10, 10, 10),
          ),
        ));
  }
}
