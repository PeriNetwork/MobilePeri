// ignore_for_file: sort_child_properties_last, unnecessary_import, implementation_imports, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:peri_mobile_flutter/peri_nav_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: PeriNavBar(), preferredSize: const Size.fromHeight(50)),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
