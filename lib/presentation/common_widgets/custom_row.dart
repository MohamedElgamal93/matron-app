import 'package:flutter/material.dart';
import 'package:environment/util/constants/colors.dart';

class CustomRow extends StatelessWidget {
  final String assetimage;
  final String details;

  const CustomRow({
    Key? key,
    required this.assetimage,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 16.8,
          height: 11.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            image: DecorationImage(
              image: AssetImage(assetimage),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            details,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: ConstColors.textSecondaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
