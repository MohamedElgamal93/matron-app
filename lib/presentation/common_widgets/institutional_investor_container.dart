import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstitutionalInvestorContainer extends StatefulWidget {
  const InstitutionalInvestorContainer({
    Key? key,
    required this.active,
    required this.firstText,
    required this.firstTextSubTitle,
    required this.secondText,
    required this.secondTextSubTitle,
    required this.thirdText,
    required this.thirdTextSubTitle,
    required this.dataSelected,
  }) : super(key: key);
  final String firstText;
  final String firstTextSubTitle;
  final String secondText;
  final String secondTextSubTitle;

  final String thirdText;
  final String thirdTextSubTitle;

  final Function(String) dataSelected;

  final int active;

  @override
  _InstitutionalInvestorContainer createState() =>
      _InstitutionalInvestorContainer();
}

class _InstitutionalInvestorContainer
    extends State<InstitutionalInvestorContainer> {
  int newValue = 1;
  bool one = false;
  bool second = false;
  bool third = true;
  bool flage = true;

  @override
  void initState() {
    // firstsaveValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                child: IconButton(
                                    icon: one == true && flage == false
                                        ? SvgPicture.asset(
                                            radioActiveSVG,
                                            width: 43,
                                            height: 45,
                                          )
                                        : SvgPicture.asset(
                                            radioNonActiveSVG,
                                            width: 43,
                                            height: 45,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        if (flage == false) {
                                        } else {
                                          one = false;
                                          second = false;
                                          third = true;
                                        }
                                        if (one == true) {
                                          newValue = 1;
                                          setState(() {
                                            widget.dataSelected(
                                                individualInvestorButton);
                                          });
                                        }
                                      });
                                    }),
                              ),
                              Container(
                                child: Text(
                                  widget.firstText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: ConstColors.textPrimaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 20, bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    widget.firstTextSubTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color:
                                                ConstColors.textTertiaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                  ))
                                ],
                              )),
                          const SizedBox(
                            height: 17,
                          ),
                          Row(
                            children: [
                              Container(
                                child: IconButton(
                                    icon: second == true && flage == false
                                        ? SvgPicture.asset(
                                            radioActiveSVG,
                                            width: 43,
                                            height: 45,
                                          )
                                        : SvgPicture.asset(
                                            radioNonActiveSVG,
                                            width: 43,
                                            height: 45,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        if (flage == false) {
                                        } else {
                                          one = false;
                                          second = false;
                                          third = true;
                                          flage = true;
                                        }
                                        if (second == true) {
                                          newValue = 2;
                                          setState(() {
                                            widget.dataSelected(
                                                profassionalInvestorButton);
                                          });
                                        }
                                      });
                                    }),
                              ),
                              Container(
                                child: Text(
                                  widget.secondText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: ConstColors.textPrimaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 20, bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    widget.secondTextSubTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color:
                                                ConstColors.textTertiaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                  ))
                                ],
                              )),
                          Row(
                            children: [
                              Container(
                                child: IconButton(
                                    icon: third == true && flage == true
                                        ? SvgPicture.asset(
                                            radioActiveSVG,
                                            width: 43,
                                            height: 45,
                                          )
                                        : SvgPicture.asset(
                                            radioNonActiveSVG,
                                            width: 43,
                                            height: 45,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        if (flage == false) {
                                        } else {
                                          one = false;
                                          second = false;
                                          third = true;
                                          flage = true;
                                        }
                                        if (third == true) {
                                          newValue = 3;
                                          setState(() {
                                            widget.dataSelected(
                                                institutionalInvestorButton);
                                          });
                                        }
                                      });
                                    }),
                              ),
                              Container(
                                child: Text(
                                  widget.thirdText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: ConstColors.textPrimaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, right: 20, bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    widget.thirdTextSubTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color:
                                                ConstColors.textTertiaryColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                  ))
                                ],
                              )),
                        ])),
              ],
            )));
  }
}
