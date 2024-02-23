import 'package:flutter/material.dart';

class Flakes extends StatelessWidget {
  const Flakes({super.key});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 40,
      child: const SizedBox(
        height: 5,
        width: 5,
        child: ColoredBox(color: Colors.blue),
      ),
    );
  }
}
