import 'package:flutter/material.dart';
import 'package:peri_mobile_flutter/api/model/peri_post.dart';

class Feed extends StatefulWidget {
  const Feed({super.key, required this.postList});

  final List<Post> postList;

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 10,
            width: 10,
            color: Colors.grey,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: widget.postList.length);
  }
}
