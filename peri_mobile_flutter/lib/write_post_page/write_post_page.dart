// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/api/model/peri_post.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_post_repository.dart';
import 'package:peri_mobile_flutter/home_page.dart';
import 'package:peri_mobile_flutter/peri_nav_bar.dart';

class WritePostPage extends StatefulWidget {
  const WritePostPage({super.key});

  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: PeriNavBar()),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/user_peri_nav.png',
                          height: 50,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 0.8 * (MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Expanded(
                              child: TextField(
                            controller: _titleController,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              hintText: 'Título',
                              hintStyle: TextStyle(color: Color.fromARGB(255, 209, 39, 39),fontSize: 18)
                              
                              ),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 0.8 * (MediaQuery.of(context).size.width),
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10)),
                          child: Expanded(
                              child: TextField(
                            controller: _descriptionController,
                            autofocus: true,
                            minLines: 1,
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Positioned(
                top: 0.7 * (MediaQuery.of(context).size.height),
                left: 0.75 * (MediaQuery.of(context).size.width),
                child: Column(
                  children: [
                    FloatingActionButton(
                        backgroundColor: Colors.red[400],
                        onPressed: () {

                        },
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: FloatingActionButton(
                          backgroundColor: Colors.red,
                          onPressed: () {
                            if (_titleController.text.isEmpty ||
                                _descriptionController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Preencha os campos obrigatórios')),
                              );
                            } else {
                              Post post = Post(
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  active: 1,
                                  author: "Administrador",
                                  createdAt: DateTime.now(),
                                  id: Random().nextInt(1000),
                                  idPeriUser: 1,
                                  numLikes: 0);

                              PeriPostRepository.addPost(post);
                              PeriPostRepository.printPostList();
                              // navigate to home page
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePagePeri()));
                            }
                          },
                          child: Icon(
                            Icons.create,
                            color: Colors.white,
                          )),
                    )
                  ],
                ))
          ],
        ));
  }
}
