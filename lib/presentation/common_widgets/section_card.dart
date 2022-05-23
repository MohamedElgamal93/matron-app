import 'package:environment/util/constants/colors.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: Colors.white, 
        border: Border.all(color: ConstColors.containersBorder, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: child,
    );
  }
}
