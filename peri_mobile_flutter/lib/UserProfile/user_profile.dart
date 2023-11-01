// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:peri_mobile_flutter/UserProfile/header_profile.dart';
import 'package:peri_mobile_flutter/UserProfile/peri_nav_bar_user_page.dart';
import 'package:peri_mobile_flutter/api/model/repository/peri_post_repository.dart';

import '../api/model/peri_post.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key, required this.periPostRepository});

  final PeriPostRepository periPostRepository;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final PeriPostRepository _periPostRepository = PeriPostRepository();
  final TextEditingController _addCommentController = TextEditingController();

  String postBuscaUser = "";
  List<Post> postListBuscaUser = [];

  void initState() {
    postListBuscaUser = _periPostRepository.getPostList();
    super.initState();
  }

  void atualizaLista(String postBusca) {
    postListBuscaUser = _periPostRepository.getPostList();

    setState(() {
      postListBuscaUser = postListBuscaUser
          .where((Post post) => postBusca.contains(post.author))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: PeriNavBarUserPage(),
          preferredSize: const Size.fromHeight(50)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HeaderProfile(
              userName: "Administrador",
              followersNumber: 3,
              followingNumber: 5,
            ),
            Expanded(
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
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
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.grey[850],
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        postListBuscaUser
                                            .elementAt(index)
                                            .author
                                            .substring(0, 1)
                                            .toUpperCase(),
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
                                      postListBuscaUser.elementAt(index).author,
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
                                padding:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Display the card's title using a font size of 24 and a dark grey color
                                    Text(
                                      postListBuscaUser.elementAt(index).title,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // Add a space between the title and the text
                                    Container(height: 10),
                                    // Display the card's text using a font size of 15 and a light grey color
                                    Text(
                                      postListBuscaUser
                                          .elementAt(index)
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
                                            postListBuscaUser
                                                .elementAt(index)
                                                .numLikes
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 25),
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
                                                postListBuscaUser
                                                        .elementAt(index)
                                                        .liked =
                                                    !postListBuscaUser
                                                        .elementAt(index)
                                                        .liked;
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
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        elevation: 16,
                                                        child: Container(
                                                          color:
                                                              Colors.grey[850],
                                                          child:
                                                              ListView.builder(
                                                                  itemCount: postListBuscaUser
                                                                      .elementAt(
                                                                          index)
                                                                      .comments
                                                                      .length,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              context,
                                                                          int index) {
                                                                    return Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              TextField(
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                            controller:
                                                                                _addCommentController,
                                                                            decoration: InputDecoration(
                                                                                border: OutlineInputBorder(),
                                                                                hintText: 'Comentário',
                                                                                hintStyle: TextStyle(color: Colors.white),
                                                                                fillColor: Colors.white),
                                                                          ),
                                                                        ),
                                                                        TextButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                postListBuscaUser.elementAt(index).comments.add(_addCommentController.text);
                                                                                _addCommentController.clear();
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Enviar',
                                                                              style: TextStyle(color: Colors.white),
                                                                            )),
                                                                        ListTile(
                                                                          leading:
                                                                              Icon(
                                                                            Icons.comment,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          title:
                                                                              Text(
                                                                            postListBuscaUser.elementAt(index).comments.elementAt(index),
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                        )
                                                                      ],
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
                    itemCount: postListBuscaUser.length))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
