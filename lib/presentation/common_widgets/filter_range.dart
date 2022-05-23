import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';

enum TypeForm {
  pricePerShare,
  price,
}

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({
    Key? key,
    required this.typeForm,
    required this.startFromBiginning,
    required this.headerRange,
    required this.callbackMinimum,
    required this.callbackMaximum,
  }) : super(key: key);
  final TypeForm typeForm;

  final String headerRange;
  final bool startFromBiginning;
  final void Function(double) callbackMinimum;
  final void Function(double) callbackMaximum;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidget();
}

class _RangeSliderWidget extends State<RangeSliderWidget> {
  late AppLocalizations localizations;
  RangeValues _currentRangeprice = const RangeValues(0, 100000);
  RangeValues _currentRangeShare = const RangeValues(0, 500000);

  RangeValues newLowerValue = const RangeValues(0, 0);

  double minNumberShare = 0;
  double maxNumberShare = 500000;
  double minNumberPrice = 0;
  double maxNumberPrice = 100000;
  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.headerRange),
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.typeForm == TypeForm.pricePerShare
                      ? Text(
                          "${minNumberShare.toInt()} ${localizations.translate(currencyDefault)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: ConstColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "${minNumberPrice.toInt()} ${localizations.translate(currencyDefault)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  color: ConstColors.blackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                        ),
                  Text(
                    localizations.translate(max),
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: ConstColors.textTertiaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
                ],
              )),
          Row(
            children: [
              Expanded(
                  child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        overlayColor: ConstColors.primaryColor,
                        activeTrackColor: ConstColors.primaryColor,
                        inactiveTrackColor: ConstColors.filterUnActive,
                        //trackHeight: 8.0,
                        thumbColor: Colors.white,
                        valueIndicatorColor: Colors.white,
                      ),
                      child: RangeSlider(
                        values: widget.typeForm == TypeForm.pricePerShare
                            ? _currentRangeShare
                            : _currentRangeprice,
                        min: widget.typeForm == TypeForm.pricePerShare
                            ? 0.0
                            : 0.0,
                        max: widget.typeForm == TypeForm.pricePerShare
                            ? 500000
                            : 100000,
                        divisions: 100,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeShare = values;
                            _currentRangeprice = values;
                          });
                        },
                        onChangeEnd: (newLowerValue) async {
                          if (widget.typeForm == TypeForm.pricePerShare) {
                            setState(() {
                              minNumberShare = newLowerValue.start;
                              maxNumberShare = newLowerValue.end;
                            });
                            widget.callbackMinimum(minNumberShare);
                            widget.callbackMaximum(maxNumberShare);
                          } else {
                            setState(() {
                              minNumberPrice = newLowerValue.start;
                              maxNumberPrice = newLowerValue.end;
                            });
                            widget.callbackMinimum(minNumberPrice);
                            widget.callbackMaximum(maxNumberPrice);
                          }
                        },
                      )))
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                  crossAxisAlignment: widget.startFromBiginning == true
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisAlignment: widget.startFromBiginning == true
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    widget.typeForm == TypeForm.pricePerShare
                        ? Text(
                            "${maxNumberShare.toInt()} ${localizations.translate(currencyDefault)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: ConstColors.textSecondaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                          )
                        : Text(
                            "${maxNumberPrice.toInt()} ${localizations.translate(currencyDefault)}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: ConstColors.textSecondaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                          )
                  ]))
        ]);
  }
}
