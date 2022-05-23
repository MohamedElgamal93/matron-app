import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:flutter/material.dart';
class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations=AppLocalizations.of(context)!;
    return   ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(0, 64)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
        overlayColor:
        MaterialStateProperty.all(Colors.transparent),
        foregroundColor:
        MaterialStateProperty.all(Colors.transparent),
        backgroundColor:
        MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      child: Text(
        localizations.translate(back),
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
