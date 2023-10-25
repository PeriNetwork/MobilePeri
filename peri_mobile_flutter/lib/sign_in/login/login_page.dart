// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peri_mobile_flutter/api/api_constants.dart';
import 'package:peri_mobile_flutter/api/api_service.dart';
import 'package:peri_mobile_flutter/api/model/peri_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormState = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                    controller: _emailController,
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
                        labelText: "Email:",
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
                    controller: _passwordController,
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                  ),
                  onPressed: () {
                    if (_loginFormState.currentState!.validate()) {
                      ApiService.login(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        if (value == 200) {
                          try {
                            PeriUser logged = ApiService.getUserByEmail(_emailController.text);
                            print(logged);
                          } catch (e) {
                            print(e);
                          }
                          
                          Navigator.pushNamed(context, '/homepage');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Login feito com sucesso !')),
                          );
                          
                          print("Conta acessada !");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Email ou senha incorretos !')),
                          );
                          print("Conta não acessada !");
                          print("Email: " + _emailController.text);
                          print("Senha: " + _passwordController.text);
                        }
                      });
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
