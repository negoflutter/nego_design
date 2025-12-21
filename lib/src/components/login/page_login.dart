import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';
import 'package:nego_design/l10n/nego_localizations.dart';

class PageLogin extends StatefulWidget {
  final Function(LoginModel model)? onPressed;
  final String? pageNamedForgetPassword;
  final String? pageNamedRegister;

  const PageLogin({
    super.key,
    this.onPressed,
    this.pageNamedRegister,
    this.pageNamedForgetPassword,
  });

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late TapGestureRecognizer _registrationRecognizer;

  @override
  void initState() {
    super.initState();
    if (mounted && widget.pageNamedRegister != null) {
      _registrationRecognizer = TapGestureRecognizer()..onTap = () {
          Navigator.pushNamed(context, widget.pageNamedRegister!);
        };
    }
  }

  @override
  void dispose() {
    super.dispose();
    _registrationRecognizer.dispose();
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BaseContainer(
      title: NegoLocalizations.of(context)?.loginTitle ?? 'Authentication',
      description: NegoLocalizations.of(context)?.loginDesc ?? 'Complete the authentication process, provide your credentials',
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            InputEmailOrPhone(controller: _emailOrPhoneController),
            const SizedBox(height: 20),
            InputPassword(controller: _passwordController),
            TextButton(
              onPressed: () {
                if (widget.pageNamedForgetPassword == null) return;
                Navigator.pushNamed(context,widget.pageNamedForgetPassword!);
              },
              child: Text(
                NegoLocalizations.of(context)?.loginForgotPassword ??
                    'Forgot my password?',
              ),
            ),
            const SizedBox(height: 10),
            BaseContainerButton(
              label: NegoLocalizations.of(context)?.enter ?? 'Enter',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.onPressed != null) {
                    widget.onPressed!(
                      LoginModel(
                        emailOrPhone: _emailOrPhoneController.text,
                        password: _passwordController.text,
                      ),
                    );
                  }
                }
              },
            ),
            const SizedBox(height: 20),
            const OrDivider(),
            const SizedBox(height: 20),
            SocialLinkButton(
              label:
                  NegoLocalizations.of(context)?.enterWith('Google') ??
                  'Enter with Google',
              image: NegoAppImage.google,
            ),
            const SizedBox(height: 20),
            SocialLinkButton(
              label:
                  NegoLocalizations.of(context)?.enterWith('Facebook') ??
                  'Enter with Facebook',
              image: NegoAppImage.facebook,
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text:
                      NegoLocalizations.of(context)?.loginNotHaveAccount ??
                      'I don\'t have an account?',
                  children: [
                    TextSpan(text: '  '),
                    TextSpan(
                      text:
                          NegoLocalizations.of(context)?.registration ??
                          'Registration',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: _registrationRecognizer,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
