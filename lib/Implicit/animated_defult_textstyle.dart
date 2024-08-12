import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedDefultTextstyleWidget extends StatefulWidget {
  final String titel;
  const AnimatedDefultTextstyleWidget({super.key, required this.titel});

  @override
  State<AnimatedDefultTextstyleWidget> createState() =>
      _AnimatedDefultTextstyleWidgetState();
}

class _AnimatedDefultTextstyleWidgetState
    extends State<AnimatedDefultTextstyleWidget> {
  Color color = Colors.indigo;
  double fontSize = 35;
  FontWeight fontWeight = FontWeight.bold;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titel),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          duration: const Duration(milliseconds: 250),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flutter'),
              Text('Flutter'),
              Text('Flutter'),
              Text('Flutter'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Random random = Random();
            color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                random.nextInt(255), 1);
            fontSize = random.nextInt(100).toDouble();
            fontWeight = FontWeight.values[random.nextInt(5)];
          });
        },
        child: const Icon(Icons.loop),
      ),
    );
  }
}
