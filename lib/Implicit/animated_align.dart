import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  final String title;
  const AnimatedAlignWidget({super.key, required this.title});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  bool isclik = false;
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
              isclik = !isclik;
            });
          },
          child: Container(
            color: Colors.indigo.withOpacity(0.5),
            width: double.infinity,
            height: 600,
            child: AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: isclik ? Alignment.topCenter : Alignment.bottomCenter,
              child: const FlutterLogo(size: 50),
            ),
          ),
        ),
      ),
    );
  }
}
