import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  final String title;
  const AnimatedPositionedWidget({super.key, required this.title});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  double top = 5;
  double left = 5;
  double right = 5;
  double bottom = 5;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            top == 5 ? top = hight * 0.4 : top = 5;
            left == 5 ? left = width * 0.4 : left = 5;
            right == 5 ? right = width * 0.4 : right = 5;
            bottom == 5 ? bottom = hight * 0.4 : bottom = 5;
          });
        },
        child: SizedBox(
          width: width,
          height: hight,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                top: top,
                left: left,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.indigoAccent,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                left: left,
                bottom: bottom,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.black,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 750),
                top: top,
                right: right,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                right: right,
                bottom: bottom,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
