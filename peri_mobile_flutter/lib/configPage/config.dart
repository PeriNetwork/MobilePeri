// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import '../peri_nav_bar.dart';

class myconfigpage extends StatefulWidget {
  const myconfigpage({super.key});

  @override
  State<myconfigpage> createState() => _myconfigpageState();
}

class _myconfigpageState extends State<myconfigpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
      child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
      
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment(0, -1),
           
        
        ),
      ),
    );
  }
}
