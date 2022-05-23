import 'package:flutter/material.dart';

showAlertDialog(BuildContext context,
    {required String messageCancel,
    required String messageConfirm,
    required String title,
    required String message ,required VoidCallback actionConfirm}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text(messageCancel),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text(messageConfirm),
    onPressed: actionConfirm,
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
