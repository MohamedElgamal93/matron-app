import 'package:flutter/material.dart';

class BackgroundCommonWidget extends StatelessWidget {
  final String? image;

  const BackgroundCommonWidget({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image ?? ""),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
