import 'package:flutter/material.dart';

BoxDecoration visibleDecoration(bool visible) {
  return BoxDecoration(
      color: visible ? colorHideOff : colorHideOn,
      borderRadius: BorderRadius.circular(5));
}

Map<int, Color> color = const {
  50: Color.fromRGBO(224, 43, 87, .1),
  100: Color.fromRGBO(224, 43, 87, .2),
  200: Color.fromRGBO(224, 43, 87, .3),
  300: Color.fromRGBO(224, 43, 87, .4),
  400: Color.fromRGBO(224, 43, 87, .5),
  500: Color.fromRGBO(224, 43, 87, .6),
  600: Color.fromRGBO(224, 43, 87, .7),
  700: Color.fromRGBO(224, 43, 87, .8),
  800: Color.fromRGBO(224, 43, 87, .9),
  900: Color.fromRGBO(224, 43, 87, 1),
};
MaterialColor primaryWarren = MaterialColor(0xFFE02B57, color);

const Color colorBlackText = Color.fromRGBO(47, 47, 51, 1);
const Color colorGrayBackgrond = Color.fromARGB(255, 242, 242, 246);
const Color colorGrayDivider = Color.fromRGBO(227, 228, 235, 1);
const Color colorGraySubtitle = Color.fromRGBO(117, 118, 128, 1);
const Color colorBrandWarren = Color.fromARGB(255, 218, 68, 86);
const Color colorHideOff = Color.fromARGB(0, 255, 255, 255);
const Color colorHideOn = colorGrayDivider;

const TextStyle titleStyle = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.8,
  color: colorBrandWarren,
  fontSize: 34,
  height: 1.3,
);
const TextStyle mediumBlackTitle1 = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.8,
  color: colorBlackText,
  fontSize: 26,
  height: 1.3,
);
const TextStyle totalStyle = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.8,
  color: colorBlackText,
  fontSize: 32,
);

const TextStyle appBarTextStyle = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.4,
  color: colorBlackText,
  fontSize: 20,
);

const TextStyle totalStyleHide = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.8,
  color: colorHideOn,
  fontSize: 32,
);

const TextStyle smallGraySubTitle = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorGraySubtitle,
  fontSize: 18,
);

const TextStyle mediunConvertBlack = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorBlackText,
  fontSize: 19,
);
const TextStyle subTitleStyleCoinHide = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorHideOn,
  fontSize: 18,
);
const TextStyle subTitleStyleMediun = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorGraySubtitle,
  fontSize: 20,
  fontWeight: FontWeight.w400,
  letterSpacing: -.2,
  height: 1.2,
);

const TextStyle mediumBlackTitle = TextStyle(
  fontFamily: "Source_Sans_Pro",
  fontSize: 22,
  color: colorBlackText,
);

const TextStyle subTitleSmallHide = TextStyle(
  fontFamily: "Source_Sans_Pro",
  fontSize: 22,
  color: colorHideOn,
);
