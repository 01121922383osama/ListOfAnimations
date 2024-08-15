import 'package:flutter/material.dart';

class SlideTransitionWidget extends StatefulWidget {
  final String title;
  const SlideTransitionWidget({super.key, required this.title});

  @override
  State<SlideTransitionWidget> createState() => SlideTransitionWidgetState();
}

class SlideTransitionWidgetState extends State<SlideTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(1.0, 1.0),
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
        child: SlideTransition(
          position: animation,
          child: const FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
