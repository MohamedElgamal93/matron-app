import 'package:environment/data/local_cache.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  /// Private key for prefered language in [SharedPreferences].

  LocalizationCubit() : super(const LocalizationInitial(null));
  /// list of available -usable- locales
  List<Locale> availableLocales = [];
  /// Fetches prefered locale from [SharedPreferences] if exists
  /// and updates [MaterialApp] widget the the fetched locale.
  getLocale() async {
    emit(const LocalizationLoading(null));
    String localeString = englishLanguageCode;
    String? pref = await LocalCache().get(languageKey);
    if (pref == null) {
      return emit(const LocalizationLoaded(null));
    } else {
      localeString = pref;
    }
    Locale? mainLocale = Locale(localeString, '');
    emit(LocalizationLoaded(mainLocale));
  }

  /// Sets selected locale to [SharedPreferences] with key `language`:[_PREFERENCES_KEY]
  /// And notifies the material app with the new selected locale.
  setLocale(Locale locale) async {
    emit(const LocalizationLoading(null));
    LocalCache().save(languageKey, locale.languageCode);
    emit(LocalizationLoaded(locale));
  }
}
