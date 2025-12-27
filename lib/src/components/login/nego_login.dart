import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

/// A complete login screen with email/phone and password inputs.
///
/// Provides form validation, forgot password link, optional social login,
/// and registration/skip login options.
///
/// Example:
/// ```dart
/// NegoLogin(
///   onPressed: (model) => authenticate(model),
///   pageNamedForgetPassword: '/forgot',
///   pageNamedRegister: '/register',
///   onPressedGoogle: () => loginWithGoogle(),
/// )
/// ```
class NegoLogin extends StatefulWidget {
  /// Callback when login form is submitted with valid credentials.
  final Function(LoginModel model)? onPressed;
  /// Named route for the forgot password page.
  final String? pageNamedForgetPassword;
  /// Named route for the registration page.
  final String? pageNamedRegister;
  /// Named route for the home page (skip login).
  final String? pageNamedHome;
  /// Container border style. Defaults to [BaseContainerType.borderTop].
  final BaseContainerType containerType;
  /// Callback for Google sign-in button.
  final Function()? onPressedGoogle;
  /// Callback for Facebook sign-in button.
  final Function()? onPressedFacebook;

  final GroupSocialType groupSocialType;

  const NegoLogin({
    super.key,
    this.onPressed,
    this.pageNamedHome,
    this.pageNamedRegister,
    this.pageNamedForgetPassword,
    this.onPressedGoogle,
    this.onPressedFacebook,
    this.containerType = BaseContainerType.borderTop,
    this.groupSocialType = GroupSocialType.linear,
  });

  @override
  State<NegoLogin> createState() => _NegoLoginState();
}

class _NegoLoginState extends State<NegoLogin> {
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoginOptions = widget.onPressedFacebook != null || widget.onPressedGoogle != null;

    return BaseContainer(
      type: widget.containerType,
      title: NegoLocalizations.of(context)?.authentication ?? 'Authentication',
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
                Navigator.pushNamed(context, widget.pageNamedForgetPassword!);
              },
              child: Text(
                NegoLocalizations.of(context)?.loginForgotPassword ?? 'Forgot my password?',
              ),
            ),
            const SizedBox(height: 10),
            BaseContainerButton(
              label: NegoLocalizations.of(context)?.enter ?? 'Enter',
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                if (widget.onPressed == null) return;
                widget.onPressed!(LoginModel(
                  emailOrPhone: _emailOrPhoneController.text,
                  password: _passwordController.text,
                ));
              },
            ),
            if (isLoginOptions) ...[
              const SizedBox(height: 20),
              const OrDivider(),
              GroupSocialButton(
                onPressedFacebook: widget.onPressedFacebook,
                onPressedGoogle: widget.onPressedGoogle,
                type: widget.groupSocialType,
              )
            ],
            const SizedBox(height: 20),
            LinkNotHaveAccount(
              pageNamedRegister: widget.pageNamedRegister,
            ),
            LinkEnterWithoutAccount(
              pageNamedHome: widget.pageNamedHome,
            )
          ],
        ),
      ),
    );
  }
}