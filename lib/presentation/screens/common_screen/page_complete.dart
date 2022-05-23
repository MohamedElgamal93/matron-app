import 'package:environment/bussniess_logic/home_navigation_cubit/home_navigation_cubit.dart';
import 'package:environment/presentation/common_widgets/appbar.dart';
import 'package:environment/presentation/common_widgets/buttonstanderd.dart';
import 'package:environment/presentation/screens/home/tabs_enum.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PageComplete extends StatefulWidget {
  final String? appParText;

  final String? firstHeadLine;
  final String? toScreen;

  final String? secondHeadLine;
  final String? actionText;

  const PageComplete(
      {Key? key,  this.appParText,
       this.firstHeadLine,
      required this.toScreen,
       this.secondHeadLine,
      this.actionText})
      : super(
          key: key,
        );

  @override
  _AddMoneyComplete createState() => _AddMoneyComplete();
}

class _AddMoneyComplete extends State<PageComplete> {
  late AppLocalizations localizations;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: appBarCommon(context),
        body: _UIDetails(),
      ),
    );
  }

  Widget _UIDetails() {
    return SafeArea(
      bottom: true,
      top: true,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.all(
            SizeConfig.height(context: context, pixels: 16),
          ),
          child: Column(
            children: [
              Expanded(child: _buildAllDataContainer()),
              _buildBack(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllDataContainer() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            checkCircleSVG,
            height: SizeConfig.height(context: context, pixels: 100),
          ),
          SizedBox(
            height: SizeConfig.height(context: context, pixels: 8),
          ),
          if((widget.firstHeadLine??'').trim().isNotEmpty)
          Align(
              alignment: Alignment.center,
              child: Text(
                "${widget.firstHeadLine}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: ConstColors.textPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
          SizedBox(
            height: SizeConfig.height(context: context, pixels: 12),
          ),
          if((widget.secondHeadLine??'').trim().isNotEmpty)

            Text(
            "${widget.secondHeadLine}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: ConstColors.textTertiaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: SizeConfig.height(context: context, pixels: 70),
          ),
          const SizedBox(
            height: 20,
          ),
        ]);
  }

  Widget _buildBack() {
    return ButtonCommonWidget(
      buttonSize: ButtonSize.fullWidth,
      voidCallback: () {
        BlocProvider.of<HomeNavigationCubit>(context)
            .changeLandingTabByName(HomeTabs.home);
        Navigator.pushNamedAndRemoveUntil(
            context, widget.toScreen ?? "", (route) => false);
      },
      textData: widget.actionText ??
          localizations
              .translate(widget.toScreen == loginScreen ? back : backToHome),
    );
  }
}
