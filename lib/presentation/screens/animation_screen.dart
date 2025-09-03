import 'package:app/presentation/widgets/animation_screen/animated_rotation.dart';
import 'package:app/presentation/widgets/animation_screen/animated_side_circle.dart';
import 'package:app/presentation/widgets/animation_screen/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final Animation<double> _animation1;
  late final Animation<double> _animation2;
  late final Animation<double> _animation3;
  late final Animation<double> _animation4;
  late final Animation<double> _animation5;
  late final Animation<double> _animation6;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (index) {
      int duration = 500;

      if (index == 0) {
        duration = 1000;
      }

      if (index == 5) {
        duration = 4000;
      }

      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: duration),
      );
    });

    _animation1 = Tween<double>(begin: 60, end: 120).animate(
      CurvedAnimation(parent: _controllers[0], curve: Curves.elasticInOut),
    );
    _animation2 = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _controllers[1], curve: Curves.elasticInOut),
    );
    _animation3 = Tween<double>(begin: -100, end: 0).animate(
      CurvedAnimation(parent: _controllers[2], curve: Curves.elasticInOut),
    );
    _animation4 = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(parent: _controllers[3], curve: Curves.elasticInOut),
    );
    _animation5 = Tween<double>(begin: 100, end: 0).animate(
      CurvedAnimation(parent: _controllers[4], curve: Curves.elasticInOut),
    );
    _animation6 = Tween<double>(begin: 0, end: 4).animate(
      CurvedAnimation(parent: _controllers[5], curve: Curves.decelerate),
    );

    _animation1.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _controllers[0].forward();
        _controllers[5].reset();
      }

      if (status.isCompleted) {
        _controllers[1].forward();
        _controllers[5].forward();
      }
    });

    _animation2.addStatusListener((status) {
      if (status.isCompleted) {
        _controllers[2].forward();
      }
    });

    _animation3.addStatusListener((status) {
      if (status.isCompleted) {
        _controllers[3].forward();
      }
    });

    _animation4.addStatusListener((status) {
      if (status.isCompleted) {
        _controllers[4].forward();
      }
    });

    _animation5.addStatusListener((status) {
      if (status == AnimationStatus.reverse && _animation6.isCompleted) {
        _controllers[0].reverse();
      }
    });

    _animation6.addStatusListener((status) {
      if (status.isCompleted) {
        _controllers[1].reverse();
        _controllers[2].reverse();
        _controllers[3].reverse();
        _controllers[4].reverse();
      }
    });

    _controllers[0].forward();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation Screen")),
      body: RepaintBoundary(
        child: RotationAnimation(
          animation: _animation6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSideCircle(
                    animation: _animation4,
                    color: Colors.purple,
                    direction: Axis.horizontal,
                  ),
                  Gap(15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedSideCircle(
                        animation: _animation5,
                        color: Colors.red,
                        direction: Axis.vertical,
                      ),
                      Gap(15),
                      SizedBox.square(dimension: 120),
                      Gap(15),
                      AnimatedSideCircle(
                        animation: _animation3,
                        color: Colors.yellow,
                        direction: Axis.vertical,
                      ),
                    ],
                  ),
                  Gap(15),
                  AnimatedSideCircle(
                    animation: _animation2,
                    color: Colors.blue,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _animation1,
                builder: (context, child) {
                  return CircleContainer(
                    size: _animation1.value,
                    color: Colors.green,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
