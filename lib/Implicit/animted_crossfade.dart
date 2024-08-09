import 'package:flutter/material.dart';

class AnimatedCrossfadeWidget extends StatefulWidget {
  final String title;
  const AnimatedCrossfadeWidget({super.key, required this.title});

  @override
  State<AnimatedCrossfadeWidget> createState() =>
      _AnimatedCrossfadeWidgetState();
}

class _AnimatedCrossfadeWidgetState extends State<AnimatedCrossfadeWidget> {
  bool isClick = false;
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
              isClick = !isClick;
            });
          },
          child: AnimatedCrossFade(
            secondChild: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Search'),
                Icon(Icons.search),
              ],
            ),
            firstChild: Container(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isClick = true;
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            crossFadeState:
                isClick ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            alignment: Alignment.centerLeft,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
