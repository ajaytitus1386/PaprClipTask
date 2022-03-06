import 'package:flutter/material.dart';

class LikeAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  const LikeAnimationWidget({
    Key? key,
    required this.isAnimating,
    required this.duration,
    this.onEnd,
    required this.child,
  }) : super(key: key);

  @override
  State<LikeAnimationWidget> createState() => _LikeAnimationWidgetState();
}

class _LikeAnimationWidgetState extends State<LikeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration);

    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);
  }

  @override
  void didUpdateWidget(LikeAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Change in state
    if (widget.isAnimating != oldWidget.isAnimating) {
      animateLike();
    }
  }

  Future animateLike() async {
    if (widget.isAnimating) {
      await animationController.forward();
      await animationController.reverse();

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
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
