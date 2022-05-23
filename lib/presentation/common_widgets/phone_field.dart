
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../util/applocalizations.dart';
import '../../util/constants/colors.dart';
import '../../util/constants/string_translate.dart';

class PhoneField extends StatelessWidget {
  PhoneField({Key? key, required this.phoneController}) : super(key: key);
  var phoneController;

  @override
  Widget build(BuildContext context) {
        final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: IntlPhoneField(
        controller: phoneController,
        dropdownDecoration: const BoxDecoration(
            shape: BoxShape.rectangle, color: Color(0xffF8FBFE)),
        showCountryFlag: false,
        showDropdownIcon: true,
        initialCountryCode: "SA",
        autoValidate: true,
        textAlign: TextAlign.start,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: localizations.translate(phoneNumber),
          fillColor: ConstColors.primaryColor,
          focusColor: ConstColors.primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        onChanged: (phone) {
          print(phone.number);
        },
        onCountryChanged: (phone) {
          print('Country code changed to:    ${phone.countryCode}');
        },
      ),
    );
  }
}
