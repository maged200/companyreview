import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage(
    this.onClose, {
    Key key,
  }) : super(key: key);

  final Function onClose;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              elevation: 5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: InkWell(
                      onTap: onClose,
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .08,
                    width: MediaQuery.of(context).size.width * .75,
                    color: Colors.white,
                    alignment: Alignment.centerRight,
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Icon(Icons.search),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
