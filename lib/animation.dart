import 'package:flakes/flakes.dart';
import 'package:flutter/material.dart';

class FlakeAnimation extends StatefulWidget {
  const FlakeAnimation(this.anim, this.posHeight, this.posWidth, {super.key});
  final Animation<double> anim;
  final double posWidth;
  final double posHeight;

  @override
  State<FlakeAnimation> createState() {
    return _FlakeAnimationState();
  }
}

class _FlakeAnimationState extends State<FlakeAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.anim,
        builder: (context, child) {
          return Positioned(
            left: widget.posWidth,
            top: (widget.posHeight - 10) * widget.anim.value,
            child: const Flakes(),
          );
        });
  }
}
