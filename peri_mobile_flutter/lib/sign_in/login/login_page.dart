// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Form(
        key: _loginFormState,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0.2 * (MediaQuery.of(context).size.width),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/round_logo_peri.png',
                    width: 50,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Entrar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 0.5 * (MediaQuery.of(context).size.width),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: SizedBox(
                      child: TextFormField(
                    maxLength: 20,
                    style: TextStyle(color: Colors.white),
                    validator: (valueNome) {
                      if (valueNome == null || valueNome.isEmpty) {
                        return "Campo obrigatório";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        labelText: "Nome:",
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )),
                  )),
                ),
              ]),
            ),
            SizedBox(
              width: 0.5 * (MediaQuery.of(context).size.width),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                      child: TextFormField(
                    validator: (valueSenha) {
                      if (valueSenha == null || valueSenha.isEmpty) {
                        return "Campo obrigatório";
                      }
                      return null;
                    },
                    maxLength: 20,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        counterText: "",
                        labelText: "Senha:",
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )),
                  )),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 0.5 * (MediaQuery.of(context).size.width),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    // TODO : BACKEND CADASTRO USUÁRIO
                    if (_loginFormState.currentState!.validate()) {
                      Navigator.pushNamed(context, '/homepage');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Login feito com sucesso !')),
                      );
                      print("Conta acessada !");
                    }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        Text(
                          "  Entrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ]),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
