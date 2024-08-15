import 'package:flutter/material.dart';

class SizeTransitionWidget extends StatefulWidget {
  final String title;
  const SizeTransitionWidget({super.key, required this.title});

  @override
  State<SizeTransitionWidget> createState() => _SizeTransitionWidgetState();
}

class _SizeTransitionWidgetState extends State<SizeTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    super.initState();
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
        child: SizeTransition(
          sizeFactor: animation,
          child: const FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
