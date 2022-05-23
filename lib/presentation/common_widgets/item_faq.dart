import 'package:environment/util/constants/colors.dart';
import 'package:flutter/material.dart';

class FaqItemWidget extends StatelessWidget {
  final String? question;
  final String? answer;

  const FaqItemWidget({Key? key, this.question, this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        title: Text(
          "$question",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Text(
              "$answer",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: ConstColors.textTertiaryColor),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
