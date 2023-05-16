// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SignInPeri extends StatefulWidget {
  const SignInPeri({super.key});

  @override
  State<SignInPeri> createState() => _SignInPeriState();
}

class _SignInPeriState extends State<SignInPeri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 0.2 * (MediaQuery.of(context).size.width),
                ),
                child: Image.asset(
                  'assets/images/round_logo_peri.png',
                  width: 0.3 * (MediaQuery.of(context).size.width),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rede Social Peri',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 0.4 * (MediaQuery.of(context).size.width),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      
                      ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    Text(
                      "  Cadastrar-se",
                      style: TextStyle(color: Colors.white, fontSize: 20,
                       fontWeight: FontWeight.w200),
                    )
                  ]),
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: 0.4 * (MediaQuery.of(context).size.width),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      //primary:
                      ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                    Text(
                      "  Fazer Login",
                      style: TextStyle(color: Colors.white, fontSize: 20,
                       fontWeight: FontWeight.w200),
                    )
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
