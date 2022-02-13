import 'package:flutter/material.dart';
import 'package:m7laty/styles/default_theme.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: DefaultTheme.lightSecondaryColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(width: .5, color: DefaultTheme.lightSecondaryColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.photo,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text("maged mohamed"),
                  Text("mobile developer"),
                ],
              ),
            ],
          ),
          Text(
              "height: double.infinity,height: double.infinity,height: double.infinity,height: double.infinity, is more art than science. Leadership is now, always has been and always will be about influence, not authority."),
        ],
      ),
    );
  }
}
