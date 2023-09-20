import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class configUserPage extends StatefulWidget {
  const configUserPage({super.key});

  @override
  State<configUserPage> createState() => _configUserPageState();
}

class _configUserPageState extends State<configUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sua App"),
        leading: Icon(Icons.menu),
        actions: [
          Icon(FontAwesomeIcons.bell),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundImage: NetworkImage("URL_DA_FOTO"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: UserSettingsPage(),
    );
  }
}

class UserSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red, // Cor da AppBar
      child: Center(
        child: Text(
          "Página de Configurações de Usuário",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

    