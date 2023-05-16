// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:peri_mobile_flutter/peri_nav_bar.dart';
import 'package:peri_mobile_flutter/postWidget/post_widget.dart';
import 'package:peri_mobile_flutter/search_bar.dart';

import 'create_post.dart';

class HomePagePeri extends StatefulWidget {
  const HomePagePeri({super.key});

  @override
  State<HomePagePeri> createState() => _HomePagePeriState();
}

class _HomePagePeriState extends State<HomePagePeri> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    // ignore: prefer_const_literals_to_create_immutables
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
        )
    );
  }
}