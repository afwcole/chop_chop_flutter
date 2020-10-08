import 'package:flutter/material.dart';

class CallToActionButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  CallToActionButton({
    @required this.onPressed,
    @required this.buttonText,
  }) : assert(buttonText != null);

  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      height: 57,
      x: -4,
      y: 8,
      blurRadius: 20,
      child: MaterialButton(
        elevation: 0,
        height: 30,
        disabledColor: Color(0xFFFFBB00).withOpacity(0.5),
        disabledTextColor: Colors.black.withOpacity(0.5),
        color: Color(0xFFFFBB00),
        textColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CustomShadow extends StatelessWidget {
  final Widget child;
  final double height, x, y, borderRadius, blurRadius;

  CustomShadow(
      {@required this.child,
      @required this.height,
      this.borderRadius = 10,
      this.x = 0,
      this.y = 0,
      this.blurRadius = 0})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      child: Wrap(
        children: <Widget>[this.child],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: blurRadius,
              offset: Offset(x, y),
            ),
          ]),
    );
  }
}
