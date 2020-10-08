import 'package:chop_chop_flutter/screens/access/onboarding_page.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageDirName;

  CategoryCard({@required this.categoryName, @required this.imageDirName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnboardingPage()));
      },
      child: Container(
        height: 96,
        width: 96,
        child: Card(
          margin: EdgeInsets.only(left: 4, right: 4), //padding around each card
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(imageDirName),
              fit: BoxFit.cover,
            )),
            child: Container(
              margin: EdgeInsets.fromLTRB(8, 0, 0, 8), //text-padding in card
              alignment: Alignment.bottomLeft,
              child: Text(
                categoryName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}