part of 'localization_cubit.dart';

@immutable
abstract class LocalizationState {
  final Locale? mainLocale;
  const LocalizationState(this.mainLocale);
}

class LocalizationInitial extends LocalizationState {
  const LocalizationInitial(Locale? mainLocale) : super(mainLocale);
}

class LocalizationLoading extends LocalizationState {
  const LocalizationLoading(Locale? mainLocale) : super(mainLocale);
}

class LocalizationLoaded extends LocalizationState {
  const LocalizationLoaded(Locale? mainLocale) : super(mainLocale);
}