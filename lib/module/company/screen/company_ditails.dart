import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:m7laty/styles/default_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(vertical: 40),
      child: Column(
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
            child: Text(
              "Company Name",
              style: TextStyle(
                  color: DefaultTheme.primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              "Company NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany NameCompany Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: DefaultTheme.darkBorderColor,
                fontSize: 16,
              ),
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
                    "Location ",
                    style: TextStyle(
                        color: DefaultTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: () async {
                      launch(
                          "https://www.google.com/maps/@30.0409028,31.1824813,14z",
                          forceSafariVC: true);
                    },
                    child: Text(
                      "https://www.google.com/maps/@30.0409028,31.1824813,14z",
                      maxLines: 1,
                      style: TextStyle(
                        color: DefaultTheme.darkBorderColor,
                        fontSize: 16,
                      ),
                    ),
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
                    "Rate ",
                    style: TextStyle(
                        color: DefaultTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: RatingBar.builder(
                    itemSize: 15,
                    allowHalfRating: false,
                    initialRating: 4,
                    itemBuilder: (context, x) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
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
                    style: TextStyle(
                        color: DefaultTheme.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await launch(
                        "https://www.linkedin.com/in/maged-mohamed-9b5759177/",
                        forceSafariVC: false);
                  },
                  child: Text(
                    "https://www.linkedin.com/in/maged-mohamed-9b5759177/",
                    style: TextStyle(
                      color: DefaultTheme.darkBorderColor,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
