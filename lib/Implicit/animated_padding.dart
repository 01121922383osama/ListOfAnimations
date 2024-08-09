import 'package:flutter/material.dart';

class AnimatedPaddingWidget extends StatefulWidget {
  final String titel;
  const AnimatedPaddingWidget({super.key, required this.titel});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {
  double padding = 60.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titel),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              padding == 60.0 ? padding = 0.0 : padding = 60.0;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.indigo,
            alignment: Alignment.center,
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.all(padding),
              child: Text(
                widget.titel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
