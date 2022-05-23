import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

enum StepRegister { registration, idVerification, password }

class StepsRegister extends StatelessWidget {
  final StepRegister stepType;
  late AppLocalizations localizations;
  StepsRegister({Key? key, this.stepType = StepRegister.registration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context)!;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              color: ConstColors.primaryColor,
              width: MediaQuery.of(context).size.width / 3,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.email,
                    size: 20,
                    color: ConstColors.whiteColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      localizations.translate(registration),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: ConstColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: stepType == StepRegister.idVerification ||
                      stepType == StepRegister.password
                  ? ConstColors.primaryColor
                  : const Color(0xffECF2F8),
              width: MediaQuery.of(context).size.width / 3,
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    identity,
                    width: 20,
                    height: 20,
                    color: stepType == StepRegister.password ||
                            stepType == StepRegister.idVerification
                        ? ConstColors.whiteColor
                        : const Color(0xff93A3B5),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.width(context: context, pixels: 8)),
                    child: Text(
                      localizations.translate(IDVerification),
                      style: stepType == StepRegister.password ||
                              stepType == StepRegister.idVerification
                          ? Theme.of(context).textTheme.caption!.copyWith(
                              color: ConstColors.whiteColor,
                              fontWeight: FontWeight.bold)
                          : Theme.of(context).textTheme.caption!.copyWith(
                              color: ConstColors.textTertiaryColor,
                              fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            color: stepType == StepRegister.password
                ? ConstColors.primaryColor
                : const Color(0xffECF2F8),
            width: MediaQuery.of(context).size.width / 3,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  passwordImage,
                  width: 20,
                  height: 20,
                  color: stepType == StepRegister.password
                      ? ConstColors.whiteColor
                      : const Color(0xff93A3B5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    localizations.translate(password),
                    style: stepType == StepRegister.password
                        ? Theme.of(context).textTheme.caption!.copyWith(
                            color: ConstColors.whiteColor,
                            fontWeight: FontWeight.bold)
                        : Theme.of(context).textTheme.caption!.copyWith(
                            color: ConstColors.textTertiaryColor,
                            fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
