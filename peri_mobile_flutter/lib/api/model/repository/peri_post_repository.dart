import 'dart:math';

import 'package:peri_mobile_flutter/api/model/peri_post.dart';

class PeriPostRepository {
  static List<Post> postList = [];

  // generate 3 fake posts and add them to the list
  PeriPostRepository() {
    postList.add(Post(
        id: 1,
        title: "Exposição de arte",
        description: "Shopping center limeira...",
        createdAt: DateTime.now(),
        active: 1,
        idPeriUser: 1,
        author: "Maria",
        numLikes: 23));

    postList.add(Post(
        id: 2,
        title: "Batalha de rima",
        description: "Em frente ao museu da cidade...",
        createdAt: DateTime.now(),
        active: 1,
        idPeriUser: 2,
        author: "Joao",
        numLikes: 33));

    postList.add(Post(
        id: 3,
        title: "Mural de Graffiti",
        description: "Mural localizado no centro de limeira...",
        createdAt: DateTime.now(),
        active: 1,
        idPeriUser: 3,
        author: "Ana Julia",
        numLikes: 12));
  }

  //add post to list
  static void addPost(Post post) {
    postList.add(post);
  }

  //get post list
  List<Post> getPostList() {
    return postList;
  }

  static void printPostList() {
    postList.forEach((element) {
      print(element.title);
    });
  }

  //get post by id
  Post getPostById(int id) {
    return postList.firstWhere((post) => post.id == id);
  }

  //remove post
  void removePost(Post post) {
    postList.remove(post);
  }

  //update post
  void updatePost(Post post) {
    int index = postList.indexWhere((element) => element.id == post.id);
    postList[index] = post;
  }

  //get posts by user id
  List<Post> getPostsByUserId(int userId) {
    return postList.where((post) => userId == userId).toList();
  }
}
