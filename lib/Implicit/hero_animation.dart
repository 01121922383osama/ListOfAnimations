import 'package:flutter/material.dart';

class HeroAnimationWidget extends StatefulWidget {
  final String title;
  const HeroAnimationWidget({super.key, required this.title});

  @override
  State<HeroAnimationWidget> createState() => _HeroAnimationWidgetState();
}

class _HeroAnimationWidgetState extends State<HeroAnimationWidget> {
  final List<String> _images = [
    'assets/1.jpeg',
    'assets/2.jpeg',
    'assets/3.jpeg',
    'assets/4.jpeg',
    'assets/5.jpeg',
    'assets/6.jpeg',
    'assets/7.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(
                    image: _images[index],
                    index: index,
                  ),
                ));
              },
              leading: Hero(
                tag: '${index + 1}',
                child: CircleAvatar(
                  backgroundImage: AssetImage(_images[index]),
                ),
              ),
              title: Text('${index + 1}'),
            ),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String image;
  final int index;
  const SecondPage({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Hero(
          tag: '${index + 1}',
          child: CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
