part of 'text_input_field.dart';
/// enum for setting the type of data and decoration required for your input
/// it's used for deciding the decorations, styling, validations and more for
/// your field without having to pass them
///
/// if you need to add a new type of text fields add it's type here to the enum
/// and handle its fields customizations in [TextInputField] `state.build()`
enum TypeForm {
  normalText,
  password,
  email,
  phone,
  phoneWithOutCode,
  amount,
  /// this doesn't show a date select filed it just adds a keyboard type and
  /// input size (4) to get date input from the user use [DateSelectionField]
  dateOfBirth,
  dateOfBusiness,
  idNumber,
  idExpirationDate,
  card,
  expirationDate,
  cvv,
  number,
  iban,
}