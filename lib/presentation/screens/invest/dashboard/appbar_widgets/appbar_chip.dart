
import 'package:flutter/material.dart';

class AppbarChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;
  const AppbarChip({
    required this.text,
    this.isSelected = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(isSelected ? 1 : 0.2),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 24,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.black : Colors.white),
        )),
      ),
    );
  }
}
