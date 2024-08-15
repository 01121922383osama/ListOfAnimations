import 'package:flutter/material.dart';

class AlgnTransitionWidget extends StatefulWidget {
  final String title;
  const AlgnTransitionWidget({super.key, required this.title});

  @override
  State<AlgnTransitionWidget> createState() => _AlgnTransitionWidgetState();
}

class _AlgnTransitionWidgetState extends State<AlgnTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<AlignmentGeometry> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    animation = Tween<AlignmentGeometry>(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(-1.0, 1.0),
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
        child: AlignTransition(
          alignment: animation,
          child: const FlutterLogo(
            size: 150,
          ),
        ),
      ),
    );
  }
}
