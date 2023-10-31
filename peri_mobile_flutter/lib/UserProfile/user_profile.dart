// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/UserProfile/header_profile.dart';
import 'package:peri_mobile_flutter/UserProfile/peri_nav_bar_user_page.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_post_repository.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.periPostRepository});

  final PeriPostRepository periPostRepository;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: PeriNavBarUserPage(), preferredSize: const Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfile(
              userName: "Administrador",
              followersNumber: 3,
              followingNumber: 5,
            ),
            
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );;
  }
}