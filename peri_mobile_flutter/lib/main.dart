import 'package:flutter/material.dart';
import 'PeriNavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: PreferredSize(child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
        body: Center(
          
        ),
        backgroundColor: Color.fromARGB(255, 10, 10, 10),
      ),
    );
  }
}
