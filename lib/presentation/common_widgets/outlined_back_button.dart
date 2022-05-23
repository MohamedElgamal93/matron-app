import 'package:flutter/material.dart';

class OutlinedBackButton extends StatelessWidget {
  final String title;

  const OutlinedBackButton({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
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
        title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
