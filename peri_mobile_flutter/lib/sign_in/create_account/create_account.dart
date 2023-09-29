// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peri_mobile_flutter/api/api_service.dart';
import 'package:peri_mobile_flutter/api/model/peri_user.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Form(
            key: _formKey,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                        top: 0.15 * (MediaQuery.of(context).size.width),
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
                            "Cadastrar-se",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w200),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 0.5 * (MediaQuery.of(context).size.width),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: SizedBox(
                              child: TextFormField(
                            controller: nameController,
                            validator: (valueNome) {
                              if (valueNome == null || valueNome.isEmpty) {
                                return "Campo obrigatório";
                              }
                              return null;
                            },
                            maxLength: 20,
                            style: TextStyle(color: Colors.white),
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
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: SizedBox(
                              child: TextFormField(
                            validator: (valueEmail) {
                              if (valueEmail == null || valueEmail.isEmpty) {
                                return "Campo obrigatório";
                              }
                              return null;
                            },
                            maxLength: 60,
                            style: TextStyle(color: Colors.white),
                            controller: emailController,
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
                        TextField(
                            style: TextStyle(color: Colors.white),
                            controller:
                                dateinput, //editing controller of this TextField
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                labelStyle: TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                labelText:
                                    "Data de Nascimento:" //label text of field
                                ),
                            readOnly:
                                true, //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print("Date is not selected");
                              }
                            }),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 30),
                          child: SizedBox(
                              child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            maxLength: 60,
                            validator: (valuePassword) {
                              if (valuePassword == null ||
                                  valuePassword.isEmpty) {
                                return "Campo obrigatório";
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.white),
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
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    PeriUser userPeri = PeriUser(
                                      nFollowers: 0,
                                      active: true,
                                      id: 0,
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      birthDate: dateinput.text,
                                      createdAt: DateTime.now());
                                    
                                    ApiService.signUp(userPeri).then((value) {
                                      if (value == 200) {
                                        Navigator.pushNamed(context, '/homepage');
                                        // scaffold messenger
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'Cadastro realizado com sucesso!'),
                                          backgroundColor: Colors.green,
                                        ));
                                      } else {
                                        print("não foi possivel cadastrar...");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              'Não foi possivel realizar o cadastro!'),
                                          backgroundColor: Colors.red,
                                        ));
                                      }
                                    });

                                  } catch (e) {
                                    print("não foi possivel cadastrar...");
                                  }
                                  
                                }
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "  Cadastrar-se",
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
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
