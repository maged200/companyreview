import 'package:flutter/material.dart';
import 'package:m7laty/module/posts/widget/comment_box.dart';

class CommentWidget extends StatelessWidget {
  final int list;
  const CommentWidget({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.builder(
        itemCount: list,
        itemBuilder: (BuildContext context, int index) {
          return CommentBox();
        },
      ),
    );
  }
}
