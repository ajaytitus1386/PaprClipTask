import 'package:flutter/material.dart';

class MuteAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  const MuteAnimationWidget({
    Key? key,
    required this.child,
    required this.isAnimating,
    required this.duration,
    this.onEnd,
  }) : super(key: key);

  @override
  State<MuteAnimationWidget> createState() => _MuteAnimationWidgetState();
}

class _MuteAnimationWidgetState extends State<MuteAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);

    opacity = Tween<double>(begin: 1, end: 0).animate(animationController);
  }

  @override
  void didUpdateWidget(MuteAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimating != oldWidget.isAnimating) {
      animateMute();
    }
  }

  Future animateMute() async {
    if (widget.isAnimating) {
      await animationController.forward();
      await Future.delayed(const Duration(seconds: 1));
      animationController.reset();

      if (widget.onEnd != null) widget.onEnd!();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(0.5)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: widget.child,
          )),
    );
  }
}
