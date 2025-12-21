// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'nego_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class NegoLocalizationsEn extends NegoLocalizations {
  NegoLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get getStarted => 'Get Started';

  @override
  String get enter => 'Enter';

  @override
  String enterWith(Object method) {
    return 'Enter with $method';
  }

  @override
  String get registration => 'Registration';

  @override
  String get loginTitle => 'Authentication';

  @override
  String get loginDesc =>
      'Complete the authentication process, provide your credentials';

  @override
  String get loginForgotPassword => 'Forgot my password?';

  @override
  String get loginNotHaveAccount => 'I don\'t have an account?';

  @override
  String get orDividerText => 'Or';

  @override
  String get inputEmailOrPhoneLabelText => 'Email or Telephone';

  @override
  String get inputEmailOrPhoneHintText => 'Enter your email or contact details';

  @override
  String get inputPasswordLabelText => 'Password';

  @override
  String get inputPasswordHintText => 'Enter your password';
}
