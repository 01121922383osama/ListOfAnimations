import 'package:animations/Explicit/algn_transition.dart';
import 'package:animations/Explicit/fade_transition.dart';
import 'package:animations/Explicit/position_transiiton.dart';
import 'package:animations/Explicit/rote_transition.dart';
import 'package:animations/Explicit/scale_transition.dart';
import 'package:animations/Explicit/size_transition.dart';
import 'package:animations/Explicit/slide_transition.dart';
import 'package:flutter/material.dart';

class ExplicitAnimations extends StatefulWidget {
  const ExplicitAnimations({super.key});

  @override
  State<ExplicitAnimations> createState() => _ExplicitAnimationsState();
}

class _ExplicitAnimationsState extends State<ExplicitAnimations> {
  List<String> pagesNames = [
    'ScaleTransition',
    'SizeTransition',
    'FadeTransition',
    'AlgnTransition',
    'SlideTransition',
    'RotationTransition',
    'PositionTransition',
  ];
  List<Widget> pageswidget(String title) => [
        ScaleTransitionWidget(title: title),
        SizeTransitionWidget(title: title),
        FadeTransitionWideWidget(title: title),
        AlgnTransitionWidget(title: title),
        SlideTransitionWidget(title: title),
        RoteTransitionWidget(title: title),
        PositionTransiitonWidget(title: title),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExplicitAnimations'),
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
                  builder: (context) => pageswidget(pagesNames[index])[index],
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
