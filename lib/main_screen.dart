import 'dart:math';

import 'package:flakes/animation.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  double currentValue = 0;
  final random = Random();
  late AnimationController animationController1;
  late AnimationController animationController2;
  late AnimationController animationController3;
  late Animation<double> flakeAnim;

  List<Widget> allFlakes = [];
  List<Widget> flakes1 = [];
  List<Widget> flakes2 = [];
  List<Widget> flakes3 = [];

  //Main variables

  List<Animation<double>> animList1 = [];
  List<Animation<double>> animList2 = [];
  List<Animation<double>> animList3 = [];

  @override
  void initState() {
    super.initState();

    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 50),
    );
    animationController3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 70),
    );

    for (int i = 1; i <= 5000; i++) {
      animList1.add(
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
              parent: animationController1,
              curve: Interval(random.nextDouble(), 1)),
        ),
      );
      animList2.add(
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
              parent: animationController2,
              curve: Interval(random.nextDouble(), 1)),
        ),
      );

      animList3.add(
        Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
              parent: animationController3,
              curve: Interval(random.nextDouble(), 1)),
        ),
      );
    }

    animationController1.repeat();
    animationController2.repeat();
    animationController3.repeat();
  }

  @override
  void dispose() {
    animationController1.dispose();
    animationController2.dispose();
    animationController3.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    flakes1 = List.generate(
      int.parse(currentValue.floor().toString()),
      (index) => FlakeAnimation(
        animList1[index],
        height,
        double.parse(random.nextInt(width.floor()).toString()),
      ),
    );
    flakes2 = List.generate(
      int.parse(currentValue.floor().toString()),
      (index) => FlakeAnimation(
        animList2[index],
        height,
        double.parse(random.nextInt(width.floor()).toString()),
      ),
    );

    flakes3 = List.generate(
      int.parse(currentValue.floor().toString()),
      (index) => FlakeAnimation(
        animList3[index],
        height,
        double.parse(random.nextInt(width.floor()).toString()),
      ),
    );

    allFlakes = [
      ...flakes1,
      ...flakes2,
      ...flakes3,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Flakes: ${(currentValue * 3).floor()}",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ...allFlakes,
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  currentValue.floor().toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Slider(
                    activeColor: Colors.blue,
                    max: 5000,
                    label: currentValue.toString(),
                    value: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
