import 'package:flutter/material.dart';
import 'package:m7laty/styles/default_theme.dart';

class PostBody extends StatefulWidget {
  const PostBody({Key key}) : super(key: key);

  @override
  _PostBodyState createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  TextEditingController _commentController = TextEditingController();

  List<String> comment = [
    "الاجابه الاوله ",
    "الاجابة الثانيه",
    "الاجابه الثالثة",
    "الاجابة الرابعه",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: DefaultTheme.darkBorderColor, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: ExpansionTile(
        initiallyExpanded: false,
        childrenPadding: EdgeInsets.all(5),
        expandedAlignment: Alignment.topRight,
        children: [
          Container(
            height: (MediaQuery.of(context).size.height * .2),
            child: ListView(
              children: comment.map((e) {
                return Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: DefaultTheme.lightSecondaryColor, width: 1)),
                    child: Text(e));
              }).toList(),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .07,
                child: TextField(
                  maxLines: null,
                  minLines: null,
                  style: new TextStyle(fontSize: 12.0),
                  keyboardType: TextInputType.multiline,
                  controller: _commentController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .1,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _commentController.text.isEmpty ||
                                _commentController.text == null
                            // ignore: deprecated_member_use
                            ? Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("يرجي اضاقة اجابة ")))
                            : comment.add(_commentController.text);
                        _commentController.clear();
                      });
                    },
                    child: Icon(Icons.send),
                  ),
                ),
              )
            ],
          ),
        ],
        title: Text(
          "هل احد يعرف اخبار عن شركة تصميم مواقع",
        ),
      ),
    );
  }
}
