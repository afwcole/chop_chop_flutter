import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCustomDraggableSheet extends StatelessWidget {
  final Widget child;

  MyCustomDraggableSheet({@required this.child});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.89,
      minChildSize: 0.52,
      initialChildSize: 0.55,
      builder: (context, controller) {
        return Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  stops: [0.0, 0.1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.white],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstATop,
              child: SingleChildScrollView(
                controller: controller,
                child: child, 
                //Where the widget is passed in and placed
              ),
            ));
      },
    );
  }
}
