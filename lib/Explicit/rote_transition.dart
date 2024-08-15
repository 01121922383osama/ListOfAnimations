import 'package:flutter/material.dart';

class RoteTransitionWidget extends StatefulWidget {
  final String title;
  const RoteTransitionWidget({super.key, required this.title});

  @override
  State<RoteTransitionWidget> createState() => RoteTransitionWidgetState();
}

class RoteTransitionWidgetState extends State<RoteTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..repeat();
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotationTransition(
        turns: animation,
        child: const Scaffold(
          backgroundColor: Colors.indigo,
          body: Center(
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}
