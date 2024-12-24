import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';

const blueGradient = LinearGradient(colors: [
  lightBlue,
  darkBlue
], begin: Alignment.centerLeft, end: Alignment.centerRight);

var blueGradientLight = LinearGradient(colors: [
  lightBlue.withOpacity(0.6),
  darkBlue.withOpacity(0.6)
], begin: Alignment.centerLeft, end: Alignment.centerRight);

const purpleGradient = LinearGradient(
  colors: [
    lightPurple,
    darkPurple,
  ],
    begin: Alignment.centerLeft, end: Alignment.centerRight);

const noGradient = LinearGradient(
    colors: [
      white,
      white
    ],
);