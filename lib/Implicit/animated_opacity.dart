import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  final String title;
  const AnimatedOpacityWidget({super.key, required this.title});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double opacity = 1.0;
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
              opacity == 1.0 ? opacity = 0.0 : opacity = 1.0;
            });
          },
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: opacity,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }
}
