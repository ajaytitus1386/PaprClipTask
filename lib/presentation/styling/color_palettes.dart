import 'package:flutter/material.dart';

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
