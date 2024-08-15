import 'package:flutter/material.dart';

class FadeTransitionWideWidget extends StatefulWidget {
  final String title;
  const FadeTransitionWideWidget({super.key, required this.title});

  @override
  State<FadeTransitionWideWidget> createState() =>
      _FadeTransitionWideWidgetState();
}

class _FadeTransitionWideWidgetState extends State<FadeTransitionWideWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FadeTransition(
          opacity: animation,
          child: const FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
