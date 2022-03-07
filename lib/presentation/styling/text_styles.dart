import 'package:flutter/material.dart';

TextStyle buildPageHeadingStyle() {
  return const TextStyle(
      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
}

TextStyle buildErrorHeadingStyle() {
  return const TextStyle(
      color: Color.fromARGB(255, 148, 21, 12),
      fontSize: 24,
      fontWeight: FontWeight.bold);
}

TextStyle buildSplashHeadingStyle() {
  return const TextStyle(
      color: Colors.white,
      fontSize: 36,
      fontWeight: FontWeight.bold,
      letterSpacing: 5);
}

TextStyle buildDefaultStyle() {
  return const TextStyle(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600);
}

TextStyle buildBoldNormalStyle() {
  return const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
}
