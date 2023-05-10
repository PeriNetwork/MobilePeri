import 'package:flutter/material.dart';

class PersistentCreatePost extends StatelessWidget {
  const PersistentCreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 50,
          child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ))
      ],
    );
  }
}

/*
class BaseCreatePost extends StatelessWidget {
  const BaseCreatePost({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: child),
      PersistentCreatePost()
    ],);
  }
}
*/