// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'nego_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class NegoLocalizationsPt extends NegoLocalizations {
  NegoLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get getStarted => 'Comece agora';

  @override
  String get enter => 'Entrar';

  @override
  String enterWith(Object method) {
    return 'Entrar com $method';
  }

  @override
  String get registration => 'Cadastramento';

  @override
  String get loginTitle => 'Autenticação';

  @override
  String get loginDesc =>
      'Faça o processo de autenticação, forneça as suas credências';

  @override
  String get loginForgotPassword => 'Esqueci minha senha?';

  @override
  String get loginNotHaveAccount => 'Não tenho conta?';

  @override
  String get orDividerText => 'Ou';

  @override
  String get inputEmailOrPhoneLabelText => 'Email ou Telephone';

  @override
  String get inputEmailOrPhoneHintText => 'Digita o email ou contato';

  @override
  String get inputPasswordLabelText => 'Senha';

  @override
  String get inputPasswordHintText => 'Digite sua senha';
}
