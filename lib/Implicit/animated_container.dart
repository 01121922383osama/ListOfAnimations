import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  final String title;
  const AnimatedContainerWidget({super.key, required this.title});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double height = 100;
  double width = 100;
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
              height == 100 ? height = 300 : height = 100;
              width == 100 ? width = 300 : width = 100;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: width,
            height: height,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}

/*
Implicit animations => build in by flutter
Explicit animation => advanced u can control it
*/ 