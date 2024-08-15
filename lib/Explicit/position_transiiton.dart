import 'package:flutter/material.dart';

class PositionTransiitonWidget extends StatefulWidget {
  final String title;
  const PositionTransiitonWidget({super.key, required this.title});

  @override
  State<PositionTransiitonWidget> createState() =>
      _PositionTransiitonWidgetState();
}

class _PositionTransiitonWidgetState extends State<PositionTransiitonWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<RelativeRect> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    animation = Tween<RelativeRect>(
      begin: RelativeRect.fromDirectional(
        textDirection: TextDirection.rtl,
        start: 10,
        top: 20,
        end: 80,
        bottom: 20,
      ),
      end: RelativeRect.fromSize(
          Rect.fromCircle(center: const Offset(1.0, 1.0), radius: 50),
          const Size(300, 300)),
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size biggest = constraints.biggest;

          return Stack(
            children: <Widget>[
              PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                    const Rect.fromLTWH(0, 0, smallLogo, smallLogo),
                    biggest,
                  ),
                  end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest,
                  ),
                ).animate(CurvedAnimation(
                  parent: animationController,
                  curve: Curves.elasticInOut,
                )),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: FlutterLogo(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
