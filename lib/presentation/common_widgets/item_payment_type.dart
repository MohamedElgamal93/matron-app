import 'package:flutter/material.dart';

class PaymentTypeWidget extends StatelessWidget {
  final String? methodType;

  const PaymentTypeWidget({Key? key, required this.methodType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              child: Image.asset("assets/images/$methodType.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "$methodType",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
