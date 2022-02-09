import 'package:animations/animations.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:m7laty/module/company/screen/company_ditails.dart';
import 'package:m7laty/styles/default_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: FlipCard(
        front: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/l.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Text(
                "الشركة الإنجليزية للنقل الجماعى",
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  color: DefaultTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "التقييم",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 10,
                  color: DefaultTheme.darkBorderColor,
                ),
              ),
            ),
            Container(
              child: RatingBar.builder(
                itemSize: 7,
                allowHalfRating: false,
                initialRating: 4,
                updateOnDrag: false,
                itemBuilder: (context, x) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: null,
              ),
            ),
          ],
        ),
        back: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .17,
              margin: EdgeInsets.all(5),
              child: Text(
                "الظهران، المملكة العربية السعودية: أعلنت الشركة العالمية للصناعات البحرية، أكبر حوض بحري في منطقة الشرق الأوسط وشمال إفريقيا، عن توقيع اتفاقية مشروع مشترك مع شركة الزامل للخدمات البحرية، يوم الأربعاء 3 نوفمبر 2021م،  لتقديم خدمات بناء وصيانة سفن الدعم البحري ذات المستوى العالمي في المملكة العربية السعودية.ستُسهم الاتفاقية طويلة الأجل في دعم جهود الشركة العالمية للصناعات البحرية لتوطين المهارات والكفاءات في المملكة وتعزيز خدمات إدارة دورة حياة المنتجات. وقد تم توقيع الاتفاقية مع أحد أكبر مصنعي ومالكي ومشغلي سفن الدعم البحرية في الشرق الأوسط والتي تدير أسطولأ يضم أكثر من 60 سفينة مختلفة في الممل",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 10,
                  color: DefaultTheme.darkBorderColor,
                ),
              ),
            ),
            OpenContainer(
              openElevation: 0,
              transitionType: ContainerTransitionType.fadeThrough,
              openBuilder: (context, action) {
                return CompanyDetails();
              },
              transitionDuration: Duration(seconds: 1),
              closedBuilder: (BuildContext context, void Function() action) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: action,
                    child: Text(
                      "تصفح",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 10,
                        color: DefaultTheme.darkBorderColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
