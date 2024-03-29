// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peri_mobile_flutter/peri_nav_bar.dart';
import 'package:peri_mobile_flutter/sign_in/sign_in.dart';

class configUserPage extends StatefulWidget {
  const configUserPage({super.key});

  @override
  State<configUserPage> createState() => _configUserPageState();
}

class _configUserPageState extends State<configUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 43, 43, 43),
            leading: BackButton(
              color: Colors.white,
            ),
            title: Text(
              "Configurações",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 20,
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(50)),
      body: UserSettingsPage(),
    );
  }
}

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.user,
                    color: Colors.red[600],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sua Conta",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Alterar Senha",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Alterar Nome",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              onTap: () {},
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.questionCircle,
                color: Colors.red[600],
              ),
              title: Text(
                "Ajuda",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                ),
              ),
              onTap: () {},
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.red[600],
              ),
              title: Text(
                "Sair",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPeri()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
