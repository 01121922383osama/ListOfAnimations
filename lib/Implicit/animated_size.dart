import 'package:flutter/material.dart';

class AnimatedSizeWidget extends StatefulWidget {
  final String title;
  const AnimatedSizeWidget({super.key, required this.title});

  @override
  State<AnimatedSizeWidget> createState() => _AnimatedSizeWidgetState();
}

class _AnimatedSizeWidgetState extends State<AnimatedSizeWidget> {
  double font = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              font == 50 ? font = 150 : font = 50;
            });
          },
          child: AnimatedSize(
            duration: const Duration(seconds: 1),
            child: FlutterLogo(
              size: font,
            ),
          ),
        ),
      ),
    );
  }
}
