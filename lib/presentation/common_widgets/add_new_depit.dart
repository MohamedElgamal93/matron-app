import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddNewDebitCardWallet extends StatelessWidget {
  final String? title;

  final String? image;

  final VoidCallback voidCallbackAction;

  const AddNewDebitCardWallet(
      {Key? key, this.title, this.image, required this.voidCallbackAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () => voidCallbackAction(),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.height(context: context, pixels: 12),
            horizontal: SizeConfig.width(context: context, pixels: 12),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffECF2F8), width: 1.0),
            color: ConstColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            // boxShadow: const <BoxShadow>[
            //   BoxShadow(
            //     color: Color(0xff0A002C3E),
            //     blurRadius: 16.0,
            //     offset: Offset(0.0, 2.0),
            //     spreadRadius: 5,
            //   ),
            // ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, color: Theme.of(context).primaryColor),
              SizedBox(
                width: SizeConfig.width(context: context, pixels: 8),
              ),
              Expanded(
                child: Text(
                  "$title",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
