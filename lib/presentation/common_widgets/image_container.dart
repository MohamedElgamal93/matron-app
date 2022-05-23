import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String assetimage;

  const ImageContainer({
    Key? key,
    required this.assetimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.5,
      width: MediaQuery.of(context).size.width / 1.2,
      child: Image.asset(
        assetimage,
      ),
    );
  }
}
