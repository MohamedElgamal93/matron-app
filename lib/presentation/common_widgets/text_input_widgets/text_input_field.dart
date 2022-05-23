import 'package:environment/bussniess_logic/text_filed_common/text_input_filed_common_cubit.dart';
import 'package:environment/presentation/common_widgets/text_input_widgets/input_validators.dart';
import 'package:environment/util/applocalizations.dart';
import 'package:environment/util/card_expiration_formatter.dart';
import 'package:environment/util/card_number_input_formatter.dart';
import 'package:environment/util/constants/colors.dart';
import 'package:environment/util/constants/sizes.dart';
import 'package:environment/util/constants/string_translate.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:environment/util/text_direction.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

part 'internal_text_field.dart';

part 'type_form_enum.dart';

/// this the global text field used throughout the application
/// it takes all parameters required for customizations and passes them after
/// processing and setting default values to the internal TextField

class TextInputField extends StatefulWidget {
  /// this is the field that's used to decide how the field will be used
  /// and behave and also decorated based on this value
  TypeForm typeForm;

  /// listens to the field error state from outside this widget
  final Function(bool)? onError;

  /// sets a custom focus node to change the field focus programmatically from
  /// outside this widget
  FocusNode? focusNode;

  /// if set to true it will disable the field editing and show a disabled
  /// decorations if you want to keep the decorations regardless of this value
  /// set `highlight` value to true or use the 'readOnly` parameter
  /// to have the same effect
  bool? enabled;

  /// set a custom style for the input typed by the user into the field
  TextStyle? textStyle;

  /// the maximum number of lines to be accepted, set later with a default value
  /// depending on the [TypeForm]
  int maxLines;

  /// the controller of the field it MUST be set and passed via the constructor
  TextEditingController? controller;

  /// the maximum length of characters the textField will accept
  int? maxLength;

  /// whether to show the content of the field or not -> used from passwords
  bool? obscureText;

  /// the type of keyboard that will be used, this field is set automatically
  /// by the field [FormType] not passed in constructor from the user
  TextInputType? textInputType;

  /// an action to be executed when user clicks on the field can be used to
  /// add behaviour for 'disabled' or 'readOnly' fields
  void Function()? onTap;

  /// used to send a custom validation for new text fields,
  /// NOTE: some input type have built in validations doesn't need sending
  /// this parameter including [TypeForm.cvv, TypeForm.email, TypeForm.password]
  String? Function(String?)? validator;

  /// used to listen to the change in the text field from outside this widget
  void Function(String)? onChange;

  /// values shown as a hint to help users know what is expected from them
  String? hintText;

  /// the label text to be shown if the field is empty
  String? labelText;

  /// used to set a custom hint style of the fields, defaults to the
  /// flutter default hint style
  TextStyle? hintStyle;

  /// the widget to be shown as suffix (at the end -right-) of the filed
  Widget? suffixIcon;

  /// the widget to be shown as prefix (at the start -left-) of the filed
  Widget? prefixIcon;

  /// the text field alignment if no value is provided it will default
  /// to the flutter localizations default text direction for the
  /// [TextAlignment.start] depending on the local default `textDirection`
  TextAlign? textAlign;

  /// the text font size defaults to '17'
  double fontSize;

  /// hide the decorations border
  final bool hideBorder;

  /// disables editing but the field itself is not disabled
  /// set `enabled` to `false` to disable all of the field
  final bool readOnly;

  /// globalKey is not required unless you want to make sure this field is never
  /// rebuilt if you want to access it by key, if not provided the text field
  /// will be assigned a default key that changes with every rebuild
  final GlobalKey? globalKey;

  /// a list of [TextInputFormatter] to customize the field formatting
  /// the default is null/empty list, if you want to create a custom
  /// input formatter create a new class the extends [TextInputFormatter]
  /// and override `formatEditUpdate` function to return your
  /// [TextEditingValue] value after processing it.
  List<TextInputFormatter> inputFormatters;

  /// the vertical space between the field borders and the content defaults `10`
  int contentVerticalPadding;

  /// field text direction if not provided the direction will be set depending
  /// on the locale
  ///
  ///`isRtl ? TextDirection.rtl : TextDirection.ltr`
  ///
  TextDirection? textDirection;
  FontWeight? fontWeight;
  double? labelHeight;
  /// shows the field highlighted with no regard to is it focused or not
  bool highlight;

  /// max height for widget
  final double? height;
  void Function()? onEditingComplete;

  TextInputField(
      {required this.typeForm,
      this.focusNode,
      this.enabled,
      this.height,
      this.readOnly = false,
        this.labelHeight,
      this.textStyle,
      this.controller,
      this.maxLength,
      this.obscureText,
      this.globalKey,
      this.fontWeight,
      this.onTap,
      this.validator,
      this.onChange,
      this.onError,
      this.hintText,
      this.labelText,
      this.hintStyle,
      this.suffixIcon,
      this.prefixIcon,
      this.hideBorder = false,
      this.contentVerticalPadding = 10,
      this.fontSize = 17,
      this.highlight = false,
      this.textAlign,
      this.maxLines = 1,
      this.onEditingComplete,
      this.inputFormatters = const <TextInputFormatter>[],
      Key? key})
      : assert(controller != null),
        super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late double widgetsMargin;

  /// used int the date selection dialog
  var currentYear = DateTime.now().year;
  double? maxHeight;
  bool isEmpty = true;
  late AppLocalizations localizations;

  /// used to listen and update the views without needing a `setState`
  late UpdatedTextInputCubit textInputCubit;

  @override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    textInputCubit = BlocProvider.of<UpdatedTextInputCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /// used to track if the field is obscured or not
    final bool isSecure = textInputCubit.toggle;

    /// custom margin value used for `TypeForm.phone` value
    widgetsMargin = SizeConfig.width(
        context: context, pixels: widget.typeForm == TypeForm.phone ? 1 : 0);

    /// registering validators
    widget.validator = widget.validator ?? textFieldGlobalValidator;

    /// Configurations switch -> set the parameters as needed for every type
    /// if you want to customize a field add the custom values to fields
    /// in it's case.
    switch (widget.typeForm) {
      case TypeForm.normalText:
        widget.textInputType = TextInputType.text;
        break;

      case TypeForm.iban:
        widget.textInputType = TextInputType.text;
        break;

      case TypeForm.password:
        widget.textInputType = TextInputType.text;
       // widget.obscureText = isSecure;
        // widget.suffixIcon = InkWell(
        //   onTap: () =>
        //       //calling UpdatedTextInputCubit Provider to set new value
        //       textInputCubit.updateToggle(),
        //   child: Icon(
        //     isSecure ? Icons.visibility : Icons.visibility_off,
        //     size: 16.0,
        //     color: ConstColors.primaryColor,
        //   ),
        // );
        break;
      case TypeForm.email:
        widget.textInputType = TextInputType.emailAddress;
        break;
      case TypeForm.phone:
        widget.contentVerticalPadding = widget.maxLength = 9;
        widget.textInputType = TextInputType.phone;
        maxHeight = widget.typeForm == TypeForm.phone
            ? SizeConfig.height(context: context, pixels: 63) + widgetsMargin
            : null;
        break;
      case TypeForm.phoneWithOutCode:
        widget.maxLength = 11;
        widget.textInputType = TextInputType.number;
        break;
      case TypeForm.number:
        widget.textInputType = TextInputType.number;
        break;
      case TypeForm.amount:
        widget.fontWeight=FontWeight.bold;
        widget.textInputType = TextInputType.number;
        widget.fontSize = 30;
        widget.prefixIcon = Container(
            padding:
                const EdgeInsets.only(top: 19, bottom: 19, left: 12, right: 20),
            child: Text(
              localizations.translate(currencyDefault),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: ConstColors.textTertiaryColor),
            ));
        widget.inputFormatters = [
          CurrencyTextInputFormatter(
            name: "",
            decimalDigits: 0,
          )
        ];
        break;
      case TypeForm.dateOfBirth:
        widget.maxLength = 4;
        widget.textInputType = TextInputType.datetime;
        break;
      case TypeForm.dateOfBusiness:
        widget.textInputType = TextInputType.datetime;
        widget.onTap = () async {
          DateTime date = DateTime(1900);
          FocusScope.of(context).requestFocus(FocusNode());

          date = (await showDatePicker(
              context: context,
              initialDate: DateTime(currentYear + 1),
              firstDate: DateTime(firstDatePicker),
              lastDate: DateTime(currentYear + 1)))!;
          widget.controller!.text =
              intl.DateFormat(formatDatePicker).format(date);
        };
        break;
      case TypeForm.idNumber:
        widget.textInputType = TextInputType.number;
        break;
      case TypeForm.idExpirationDate:
        widget.textInputType = TextInputType.number;
        break;
      case TypeForm.card:
        widget.textDirection = TextDirection.ltr;
        widget.textAlign ??= (context.isRtl ? TextAlign.end : TextAlign.start);
        widget.textInputType = TextInputType.number;
        widget.inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(16),
          CardNumberInputFormatter()
        ];
        break;
      case TypeForm.expirationDate:
        widget.textInputType = TextInputType.number;
        widget.inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(4),
          CardExpirationFormatter()
        ];
        break;
      case TypeForm.cvv:
        widget.obscureText = true;
        widget.textDirection = TextDirection.ltr;
        widget.textAlign ??= (context.isRtl ? TextAlign.end : TextAlign.start);

        widget.textInputType = TextInputType.number;
        widget.inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(3),
        ];
        break;
    }

    maxHeight ??= widget.height;
    return _buildCustomizedField(
      context,

      /// passing the values after customization to the [InternalTextField]
      InternalTextField._(
        fontWeight:widget.fontWeight,
        key: widget.globalKey,
        textInputType: widget.textInputType,
        focusNode: widget.focusNode,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        textStyle: widget.textStyle,
        textDirection: widget.textDirection,
        controller: widget.controller,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText,
        onTap: widget.onTap,
        validator: widget.validator,
        labelHeight: widget.labelHeight,
        onChange: widget.onChange,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: widget.hintStyle,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        inputFormatters: widget.inputFormatters,
        contentVerticalPadding: widget.contentVerticalPadding,
        fontSize: widget.fontSize,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        onEditingComplete: widget.onEditingComplete,
      ),
    );
  }

  /// takes the text field widget that will be displayed with the built in
  /// decorations and styling, will be used by overriding the passed text field,
  /// if you want to build a complex or highly customized text field,
  /// for example:  date selection is built from three text fields and sharing
  /// data between each other to build a single usable piece of data.
  Column _buildCustomizedField(
    BuildContext context,
    Widget fieldWidget, {

    /// `shouldUpdateFocus` if true field focus will be handled automatically
    bool shouldUpdateFocus = true,
  }) {
    if (!shouldUpdateFocus) textInputCubit.isFocused = true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          onFocusChange: shouldUpdateFocus
              ? (bool focus) {
                  textInputCubit.isFocused = focus;
                }
              : null,
          child: Container(
            height: widget.height,
            decoration: _defaultDecoration(textInputCubit.isFocused),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.typeForm == TypeForm.phone) ...[
                  _countryCodePickerWidget(height: maxHeight),
                  Container(
                      height:
                          maxHeight == null ? null : maxHeight! + widgetsMargin,
                      width: 1,
                      color: textInputCubit.isFocused || widget.highlight
                          ? ConstColors.focusColor
                          : textInputCubit.isError
                              ? ConstColors.errorColor
                              : ConstColors.textQuointaryColor),
                ],
  if (widget.typeForm == TypeForm.password) ...[
                //  _countryCodePickerWidget(height: maxHeight),
             
            Padding(padding: const EdgeInsets.only(right: 15),
               child:  
               Image.asset("assets/images/splash/lock.png"),
             //  Icon(Icons.lock,color: Colors.grey,)
             )
           
                ],
                 if (widget.typeForm == TypeForm.phoneWithOutCode) ...[
                //  _countryCodePickerWidget(height: maxHeight),
             
            Padding(padding: const EdgeInsets.only(right: 15),
               child:  Image.asset("assets/images/splash/phone.png"),
             )
           
                ],

                Flexible(
                  child:
                  Column(
                    children: [
    Container(
                    height:
                        maxHeight == null ? null : (maxHeight! - widgetsMargin),
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.symmetric(vertical: widgetsMargin),
                    child: fieldWidget,
                  ),
 if (widget.typeForm == TypeForm.dateOfBusiness) ...[   
   Row(
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
       Padding(padding: EdgeInsets.only(left: 20,right: 20),child:
       InkWell(onTap:   widget.onTap = () async {
          DateTime date = DateTime(1900);
          FocusScope.of(context).requestFocus(FocusNode());

          date = (await showDatePicker(
              context: context,
              initialDate: DateTime(currentYear + 1),
              firstDate: DateTime(firstDatePicker),
              lastDate: DateTime(currentYear + 1)))!;
          widget.controller!.text =
              intl.DateFormat(formatDatePicker).format(date);
        },child: 
  Image.asset("assets/images/splash/datePicker.png")), 
   )],),
         
        const Divider(thickness: 1)
           
                ],

              
                    ],
                  )
               
                ),


              ],
            ),
          ),
        ),
        if (textInputCubit.isError) buildFieldErrorWidget(context),
      ],
    );
  }

  Widget _countryCodePickerWidget({double? height}) {
    return Container(
      height: SizeConfig.height(context: context, pixels: 64),
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.width(context: context, pixels: 16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            localizations.translate(code),
            style: Theme.of(context)
                .textTheme
                .overline!
                .copyWith(color: ConstColors.secondGrey),
          ),
          Text(
            codeCountryNumber,
            textDirection: TextDirection.ltr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: ConstColors.textPrimaryColor),
          ),
        ],
      ),
    );
  }

  /// default error widget when `isError` flag is true
  Text buildFieldErrorWidget(BuildContext context) {
    return Text(
      textInputCubit.errorMessage,
      style: Theme.of(context)
          .textTheme
          .caption
          ?.copyWith(color: ConstColors.errorColor),
    );
  }

  BoxDecoration _defaultDecoration(bool focusField) {
    return BoxDecoration(
      boxShadow:  <BoxShadow>[
        if (widget.typeForm != TypeForm.dateOfBusiness) ...[
               const BoxShadow(
                color: ConstColors.n3,
               // blurRadius: 1.0,
                offset: Offset(0.1, 2.0),
                spreadRadius: .05,
              ),
                ],
           
            ],
      color: ConstColors.whiteColor,
      borderRadius: BorderRadius.circular(15),
      // border: widget.hideBorder
      //     ? const Border.fromBorderSide(BorderSide.none)
      //     : Border.all(
      //         color: _getBorderColor(focusField),
      //       ),
    );
  }

  Color _getBorderColor(bool focused) {
    return focused || widget.highlight
        ? ConstColors.focusColor
        : textInputCubit.isError
            ? ConstColors.errorColor
            : ConstColors.textQuointaryColor;
  }

  // Validators by from type
  void setError(bool hasError, String? error) {
    if (widget.onError != null) {
      widget.onError!(hasError);
    }
    textInputCubit.setErrorMessage(hasError, error ?? '');
  }

  String? textFieldGlobalValidator(value) {
    if ((value ?? '').trim().isEmpty) {
      setError(true, localizations.translate(validationEmpty));
      return '';
    } else if (widget.typeForm == TypeForm.cvv && !isValidCVV(value)) {
      setError(true, localizations.translate(cvvInvalid));
      return '';
    } else if (widget.typeForm == TypeForm.email && !isValidEmail(value!)) {
      setError(true, localizations.translate(validationEmail));
      return '';
    } else if (widget.typeForm == TypeForm.password &&
        !isPasswordValid(value!)) {
      setError(true, localizations.translate(validationPassword));
      return '';
    } else if (widget.typeForm == TypeForm.phoneWithOutCode &&
        !isPhoneNumberValid(value!)) {
      setError(true, localizations.translate(validationPhone));
      return '';
    } 
    setError(false, null);
    return null;
  }
}
