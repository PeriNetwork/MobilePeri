// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_post_repository.dart';
import 'package:peri_mobile_flutter/peri_nav_bar.dart';
import 'package:peri_mobile_flutter/search_bar.dart';

class HomePagePeri extends StatefulWidget {
  const HomePagePeri({super.key});

  @override
  State<HomePagePeri> createState() => _HomePagePeriState();
}

class _HomePagePeriState extends State<HomePagePeri> {
  final PeriPostRepository _periPostRepository = PeriPostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: PeriNavBar(), preferredSize: Size.fromHeight(50)),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SearchBarPeri(),
              FloatingActionButton(
                shape: CircleBorder(),
                focusColor: Colors.grey,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/writePost');
                  initState();
                },
                child: Icon(
                  Icons.draw,
                  color: Colors.red,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) => Card(
                        color: Colors.grey[850],
                        // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        // Set the clip behavior of the card
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        // Define the child widgets of the card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              color: Colors.grey[850],
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      _periPostRepository
                                          .getPostList()[index]
                                          .author
                                          .substring(0, 1),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    _periPostRepository
                                        .getPostList()[index]
                                        .author,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Text("Excluir"),
                                          value: 2,
                                          onTap: () {
                                            setState(() {
                                              _periPostRepository.removePost(
                                                  _periPostRepository
                                                      .getPostList()[index]);
                                            });
                                          },
                                        ),
                                      ];
                                    },
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                            Image.asset(
                              'assets/images/post_media.png',
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            // Add a container with padding that contains the card's title, text, and buttons
                            Container(
                              color: Colors.grey[850],
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Display the card's title using a font size of 24 and a dark grey color
                                  Text(
                                    _periPostRepository
                                        .getPostList()[index]
                                        .title,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // Add a space between the title and the text
                                  Container(height: 10),
                                  // Display the card's text using a font size of 15 and a light grey color
                                  Text(
                                    _periPostRepository
                                        .getPostList()[index]
                                        .description,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          _periPostRepository
                                              .getPostList()[index]
                                              .numLikes
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 25),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: LikeButton(
                                          //isLiked: _periPostRepository.getPostList()[index].liked,
                                          size: 30,
                                          circleColor: CircleColor(
                                              start: Colors.red,
                                              end: Colors.red),
                                          bubblesColor: BubblesColor(
                                            dotPrimaryColor: Colors.red,
                                            dotSecondaryColor: Colors.red,
                                          ),
                                          onTap: (isLiked) {
                                            if (isLiked) {
                                              _periPostRepository
                                                  .getPostList()[index]
                                                  .numLikes--;
                                            } else {
                                              _periPostRepository
                                                  .getPostList()[index]
                                                  .numLikes++;
                                            }
                                            setState(() {
                                              _periPostRepository
                                                  .getPostList()[index]
                                                  .liked = !isLiked;
                                            });
                                            return Future.value(!isLiked);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.comment,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      elevation: 16,
                                                      child: Container(
                                                        color: Colors.grey[850],
                                                        child: ListView.builder(
                                                            itemCount:
                                                                _periPostRepository
                                                                    .getPostList()[
                                                                        index]
                                                                    .comments
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return ListTile(
                                                                title: Text(
                                                                  _periPostRepository
                                                                      .getPostList()[
                                                                          index]
                                                                      .comments[index],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                    );
                                                  });
                                            },
                                          ))
                                    ],
                                  ),

                                  // Add a row with two buttons spaced apart and aligned to the right side of the card
                                ],
                              ),
                            ),
                            // Add a small space between the card and the next widget
                            Container(height: 5),
                          ],
                        ),
                      ),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: Colors.black,
                      ),
                  itemCount: _periPostRepository.getPostList().length)),
        ],
      ),
    );
  }
}
