import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'nego_localizations_en.dart';
import 'nego_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of NegoLocalizations
/// returned by `NegoLocalizations.of(context)`.
///
/// Applications need to include `NegoLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/nego_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: NegoLocalizations.localizationsDelegates,
///   supportedLocales: NegoLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the NegoLocalizations.supportedLocales
/// property.
abstract class NegoLocalizations {
  NegoLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static NegoLocalizations? of(BuildContext context) {
    return Localizations.of<NegoLocalizations>(context, NegoLocalizations);
  }

  static const LocalizationsDelegate<NegoLocalizations> delegate =
      _NegoLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @enterWith.
  ///
  /// In en, this message translates to:
  /// **'Enter with {method}'**
  String enterWith(Object method);

  /// No description provided for @registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get registration;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get loginTitle;

  /// No description provided for @loginDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete the authentication process, provide your credentials'**
  String get loginDesc;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot my password?'**
  String get loginForgotPassword;

  /// No description provided for @loginNotHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'I don\'t have an account?'**
  String get loginNotHaveAccount;

  /// No description provided for @orDividerText.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get orDividerText;

  /// No description provided for @inputEmailOrPhoneLabelText.
  ///
  /// In en, this message translates to:
  /// **'Email or Telephone'**
  String get inputEmailOrPhoneLabelText;

  /// No description provided for @inputEmailOrPhoneHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or contact details'**
  String get inputEmailOrPhoneHintText;

  /// No description provided for @inputPasswordLabelText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get inputPasswordLabelText;

  /// No description provided for @inputPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get inputPasswordHintText;
}

class _NegoLocalizationsDelegate
    extends LocalizationsDelegate<NegoLocalizations> {
  const _NegoLocalizationsDelegate();

  @override
  Future<NegoLocalizations> load(Locale locale) {
    return SynchronousFuture<NegoLocalizations>(
      lookupNegoLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_NegoLocalizationsDelegate old) => false;
}

NegoLocalizations lookupNegoLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return NegoLocalizationsEn();
    case 'pt':
      return NegoLocalizationsPt();
  }

  throw FlutterError(
    'NegoLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
