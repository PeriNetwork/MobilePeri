import 'dart:math';

import 'package:peri_mobile_flutter/api/model/peri_post.dart';

class PeriPostRepository {
  List<Post> postList = [];

  // create 3 fake posts and add to postlist
  PeriPostRepository() {
    postList.add(Post(
        id: Random.secure().nextInt(1000),
        title: "Post 1",
        description: "Description 1",
        createdAt: DateTime.now(),
        active: 1,
        idPeriUser: 1));
    postList.add(Post(
        id: Random.secure().nextInt(1000),
        title: "Post 2",
        description: "Description 2",
        createdAt: DateTime.now(),
        active: 1,
        idPeriUser: 1));
    postList.add(Post(
        id: Random.secure().nextInt(1000),
        title: "Post 3",
        description: "Description 3",
        createdAt: DateTime.now(),
        active: 1,
        idPeriUser: 1));
  }

  //add post to list
  void addPost(Post post) {
    postList.add(post);
  }

  //get post list
  List<Post> getPostList() {
    return postList;
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
