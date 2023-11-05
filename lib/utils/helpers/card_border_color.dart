import 'package:flutter/material.dart';
import 'package:mafia/utils/constants/godfather.dart';

Color cardBorderColor(Side playerSide) {
  switch (playerSide) {
    case Side.mafia:
      return const Color.fromRGBO(200, 0, 0, 1);
    case Side.independent:
      return Colors.yellow;
    default:
      return Colors.lightBlue;
  }
}
