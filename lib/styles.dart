import 'package:flutter/material.dart';

const Color colorBlackText = Color.fromRGBO(47, 47, 51, 1);
const Color colorGrayDivider = Color.fromRGBO(227, 228, 235, 1);
const Color colorGraySubtitle = Color.fromRGBO(117, 118, 128, 1);
const Color colorBrandWarren = Color.fromRGBO(224, 43, 87, 1);
const Color colorPositiveText = Color.fromRGBO(0, 76, 58, 1);
const Color colorNegativeBackgroud = Color.fromRGBO(247, 161, 161, 1);
const Color colorNegativeText = Color.fromRGBO(128, 13, 13, 1);
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
const TextStyle totalStyle = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.8,
  color: colorBlackText,
  fontSize: 34,
);
const TextStyle totalStyleHide = TextStyle(
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w700,
  letterSpacing: -.8,
  color: colorHideOn,
  fontSize: 34,
);

const TextStyle subTitleStyleCoin = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorGraySubtitle,
  fontSize: 18,
);
const TextStyle subTitleStyleCoinHide = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorHideOn,
  fontSize: 18,
);
const TextStyle subTitleStyleTotal = TextStyle(
  fontFamily: "Source_Sans_Pro",
  color: colorGraySubtitle,
  fontSize: 20,
  letterSpacing: -.2,
  height: 1.2,
);

const TextStyle valueStyle = TextStyle(
  fontFamily: "Source_Sans_Pro",
  fontSize: 22,
  color: colorBlackText,
);

const TextStyle valueStyleHide = TextStyle(
  fontFamily: "Source_Sans_Pro",
  fontSize: 22,
  color: colorHideOn,
);
