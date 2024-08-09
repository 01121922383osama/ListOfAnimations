import 'package:animations/Explicit/explicit_animations.dart';
import 'package:animations/Implicit/implicit_animatioons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> pagesNames = [
    'ImplicitAnimatioons',
    'ExplicitAnimation',
  ];
  List<Widget> pageswidget = [
    const ImplicitAnimatioons(),
    const ExplicitAnimations(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(pagesNames[index]),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => pageswidget[index],
                ));
              },
            ),
          );
        },
        itemCount: pagesNames.length,
      ),
    );
  }
}
