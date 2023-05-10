// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0.85 * (MediaQuery.of(context).size.height),
        left: 0.75 * (MediaQuery.of(context).size.width),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/writePost');
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
