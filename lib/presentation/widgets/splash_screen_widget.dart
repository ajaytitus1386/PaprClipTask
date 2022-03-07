import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:papr_clip_task/presentation/animations/splash_page_route.dart';
import 'package:papr_clip_task/presentation/styling/color_palettes.dart';
import 'package:papr_clip_task/presentation/styling/text_styles.dart';

class SplashScreenWidget extends StatefulWidget {
  final Widget nextChild;
  const SplashScreenWidget({Key? key, required this.nextChild})
      : super(key: key);

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with SingleTickerProviderStateMixin {
  final lifetime = 5;
  final loaderStartTime = 4700; //milliseconds  // Less than lifetime
  final scaleDuration = 300; //milliseconds
  final rotateDuration = 1000; //milliseconds
  var loaderScale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: rotateDuration));

    Timer(Duration(milliseconds: loaderStartTime), () {
      _controller.forward();
      setState(() {
        loaderScale = 0;
      });
    });

    Timer(Duration(seconds: lifetime), () {
      Navigator.of(context)
          .pushReplacement(splashPageBuilder(widget.nextChild, context));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(gradient: splashScreenGradient),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    scale: loaderScale,
                    duration: Duration(milliseconds: scaleDuration),
                    child: RotationTransition(
                      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                      child: const SpinKitFadingCube(
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Flix',
                    style: buildSplashHeadingStyle(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
