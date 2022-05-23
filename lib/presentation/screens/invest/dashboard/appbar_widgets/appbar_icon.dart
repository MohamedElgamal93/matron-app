import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  const AppbarIcon({
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.white.withOpacity(0.5),
        size: 28,
      ),
    );
  }
}
