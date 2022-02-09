import 'package:flutter/material.dart';
import 'package:m7laty/styles/default_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

class PersonInfo extends StatefulWidget {
  @override
  _PersonInfoState createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  final titleStyle = TextStyle(
      color: DefaultTheme.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.bold);
  final subtitleStyle = TextStyle(
    color: DefaultTheme.darkBorderColor,
    fontSize: 16,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: ListView(
        children: [
          CircleAvatar(
            backgroundColor: DefaultTheme.darkBorderColor,
            radius: 60,
            child: Icon(
              Icons.photo,
              size: 80,
              color: DefaultTheme.lightColor,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "UserName ",
                    style: titleStyle,
                  ),
                ),
                Container(
                  child: Text(
                    "Maged Mohamed Abd-elftah",
                    style: subtitleStyle,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Date",
                    style: titleStyle,
                  ),
                ),
                Container(
                  child: Text(
                    "1/1/1995",
                    style: subtitleStyle,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Specialization",
                    style: titleStyle,
                  ),
                ),
                Container(
                  child: Text(
                    "quality engineer",
                    style: subtitleStyle,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Years of Experience",
                    style: titleStyle,
                  ),
                ),
                Container(
                  child: Text(
                    "3",
                    style: subtitleStyle,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Company Name",
                    style: titleStyle,
                  ),
                ),
                Container(
                  child: Text(
                    "Ctrl-plus",
                    style: subtitleStyle,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "LinkedIn Profile",
                    style: titleStyle,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    final String appleMapsUrl =
                        "https://www.linkedin.com/in/maged-mohamed-9b5759177/";
                    if (await canLaunch(appleMapsUrl)) {
                      await launch(appleMapsUrl, forceSafariVC: false);
                    } else {
                      throw "Couldn't launch URL";
                    }
                  },
                  child: Text(
                    "https://www.linkedin.com/in/maged-mohamed-9b5759177/",
                    style: subtitleStyle,
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "CV",
                    style: titleStyle,
                  ),
                ),
                InkWell(
                    onTap: () async {
                      FilePickerResult result = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                    },
                    child: Icon(
                      Icons.file_download,
                      color: DefaultTheme.darkBorderColor,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
