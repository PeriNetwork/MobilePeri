// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchBarPeri extends StatelessWidget {
  const SearchBarPeri({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 0.8 * (MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: Colors.red,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Procurar...",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
