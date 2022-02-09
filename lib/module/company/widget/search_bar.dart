import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key key, @required this.searchString, @required this.openContainer})
      : super(key: key);

  final String searchString;
  final VoidCallback openContainer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openContainer,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        padding: EdgeInsets.all(10),
        color: Colors.white,
        alignment: Alignment.centerRight,
        child: Row(
          children: [Icon(Icons.search), Text(searchString ?? "")],
        ),
      ),
    );
  }
}
