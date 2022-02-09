import 'package:flutter/material.dart';
import 'package:m7laty/module/posts/widget/Post.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostBody(),
        PostBody(),
        PostBody(),
        PostBody(),
        PostBody(),
        PostBody()
      ],
    );
  }
}
