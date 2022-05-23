part of 'text_input_field.dart';

/// the actual [TextFormField] displayed to the user  it takes all its
/// parameter pre-customized and just shows it,
///
/// this widget is part of [TextInputField] and cannot be used anywhere else
/// as it has one `private` constructor
class InternalTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final bool? enabled;
  final TextStyle? textStyle;
  final int maxLines;
  final TextEditingController? controller;
  final int? maxLength;
  final bool? obscureText;
  final TextInputType? textInputType;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final double? labelHeight;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final double fontSize;
  final List<TextInputFormatter> inputFormatters;
  final int contentVerticalPadding;
  final bool readOnly;
  final FontWeight? fontWeight;
  final void Function()? onEditingComplete;
  const InternalTextField._({
    Key? key,
    required this.textInputType,
    this.focusNode,
    this.enabled,
    this.fontWeight,
    this.textStyle,
    this.controller,
    this.maxLength,
    this.obscureText = false,
    this.onTap,
    this.labelHeight,
    this.textDirection,
    this.validator,
    this.onChange,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.contentVerticalPadding = 10,
    this.fontSize = 17,
    this.textAlign,
    this.onEditingComplete,
    this.maxLines = 1,
    this.inputFormatters = const <TextInputFormatter>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    return TextFormField(
      key: key,
      textDirection: textDirection ??
          (context.isRtl ? TextDirection.rtl : TextDirection.ltr),
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      validator: validator,
      onChanged: onChange,
      onEditingComplete: onEditingComplete,
      toolbarOptions: const ToolbarOptions(
        copy: false,
        cut: false,
        paste: true,
        selectAll: false,
      ),
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
      // if style is provided use it else use enabled or disabled style
      style: textStyle ??
          (enabled == false
              ? themeData.caption!.copyWith(
                  color: ConstColors.textPrimaryColor.withOpacity(.4),
                )
              : themeData.bodyText2?.copyWith(
                  fontSize: fontSize,
            fontWeight: fontWeight??themeData.bodyText2?.fontWeight
                )),
      textAlign: textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            themeData.bodyText1?.copyWith(color: ConstColors.fourthGrey),
        counterText: "",
        isDense: true,
        labelStyle:
            themeData.bodyText2!.copyWith(color: ConstColors.secondGrey ,height: labelHeight??themeData.bodyText2?.height),
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        alignLabelWithHint: false,
        filled: false,
        fillColor: ConstColors.primaryColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(context: context, pixels: 15),
          vertical: SizeConfig.height(
              context: context, pixels: contentVerticalPadding),
        ),
        errorText: '',
        errorStyle: const TextStyle(fontSize: 0, height: 0),
        prefixIcon: prefixIcon,
        labelText: labelText,
      ),
    );
  }
}
