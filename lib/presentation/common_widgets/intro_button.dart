import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const IntroButton({Key ? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton (
      onPressed: onPressed,
      child: child,
    );
  }
}
