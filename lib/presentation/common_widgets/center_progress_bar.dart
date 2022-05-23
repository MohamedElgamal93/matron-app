import 'package:environment/util/constants/colors.dart';
import 'package:flutter/material.dart';

class CenterCircularProgressbar extends StatelessWidget {
  const CenterCircularProgressbar({
    Key? key,
    required bool submitProgressVisibility,
  })  : _submitProgressVisibility = submitProgressVisibility,
        super(key: key);

  final bool _submitProgressVisibility;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
          visible: _submitProgressVisibility,
          child: const CircularProgressIndicator(
            color: ConstColors.primaryColor            
            ,)),
    );
  }
}