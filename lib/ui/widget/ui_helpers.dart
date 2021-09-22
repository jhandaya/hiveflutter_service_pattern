import 'package:flutter/material.dart';

const Widget horizontalSpace5 = SizedBox(width: 5.0);
const Widget horizontalSpace10 = SizedBox(width: 10.0);
const Widget horizontalSpace25 = SizedBox(width: 25.0);
const Widget horizontalSpace30 = SizedBox(width: 30.0);

const Widget emptySpace = SizedBox(height: 0, width: 0);
const Widget verticalSpace5 = SizedBox(height: 5.0);
const Widget verticalSpace10 = SizedBox(height: 10.0);
const Widget verticalSpace15 = SizedBox(height: 15.0);
const Widget verticalSpace20 = SizedBox(height: 20.0);
const Widget verticalSpace25 = SizedBox(height: 25.0);
const Widget verticalSpace50 = SizedBox(height: 50.0);

const Widget verticalSpace120 = SizedBox(height: 120.0);

Widget spacedDivider = Column(
  children: const <Widget>[
    verticalSpace25,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpace25,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);
