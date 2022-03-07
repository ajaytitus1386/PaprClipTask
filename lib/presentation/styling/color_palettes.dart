import 'package:flutter/material.dart';

Color primary = Colors.white;
Color secondary = Colors.black87;
Color likeRed = Colors.red.shade400;

LinearGradient reelTopGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.black, Colors.transparent],
    stops: [0.5]);

RadialGradient splashScreenGradient = RadialGradient(
  colors: [Colors.black, Colors.black.withOpacity(0.85)],
  stops: const [0.1, 0.9],
  radius: 1.5,
);
