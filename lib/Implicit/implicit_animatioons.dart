import 'package:animations/Implicit/animated_align.dart';
import 'package:animations/Implicit/animated_container.dart';
import 'package:animations/Implicit/animated_defult_textstyle.dart';
import 'package:animations/Implicit/animated_opacity.dart';
import 'package:animations/Implicit/animated_padding.dart';
import 'package:animations/Implicit/animated_size.dart';
import 'package:animations/Implicit/animted_crossfade.dart';
import 'package:animations/Implicit/animted_possitioned.dart';
import 'package:animations/Implicit/hero_animation.dart';
import 'package:flutter/material.dart';

class ImplicitAnimatioons extends StatefulWidget {
  const ImplicitAnimatioons({super.key});

  @override
  State<ImplicitAnimatioons> createState() => _ImplicitAnimatioonsState();
}

class _ImplicitAnimatioonsState extends State<ImplicitAnimatioons> {
  List<String> pagesNames = [
    'AnimtedContainer',
    'AnimatedOpacity',
    'AnimatedPadding',
    'AnimatedAlign',
    'AnimatedCrossfade',
    'AnimatedSize',
    'AnimatedPositioned',
    'HeroAnimation',
    'AnimatedDefaultTextstyle',
  ];
  List<Widget> pageswidget(String title) => [
        AnimatedContainerWidget(title: title),
        AnimatedOpacityWidget(title: title),
        AnimatedPaddingWidget(titel: title),
        AnimatedAlignWidget(title: title),
        AnimatedCrossfadeWidget(title: title),
        AnimatedSizeWidget(title: title),
        AnimatedPositionedWidget(title: title),
        HeroAnimationWidget(title: title),
        AnimatedDefultTextstyleWidget(titel: title),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImplicitAnimatioons'),
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
