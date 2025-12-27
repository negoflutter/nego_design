import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class NegoRegister extends StatefulWidget {
  final Function(RegisterModel model)? onPressed;
  final String? pageNamedLogin;
  final String? pageNamedHome;
  final BaseContainerType containerType;
  final Function()? onPressedGoogle;
  final Function()? onPressedFacebook;
  final GroupSocialType groupSocialType;

  const NegoRegister({
    super.key,
    this.pageNamedLogin,
    this.onPressed,
    this.pageNamedHome,
    this.onPressedGoogle,
    this.onPressedFacebook,
    this.containerType = BaseContainerType.borderTop,
    this.groupSocialType = GroupSocialType.linear,
  });

  @override
  State<NegoRegister> createState() => _NegoRegisterState();
}

class _NegoRegisterState extends State<NegoRegister> {
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late TapGestureRecognizer _loginRecognizer;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _loginRecognizer = TapGestureRecognizer()
        ..onTap = () {
          Navigator.pushNamed(context, widget.pageNamedLogin!);
        };
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _loginRecognizer.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BaseContainer(
      type: widget.containerType,
      title: NegoLocalizations.of(context)?.registration ?? 'Registration',
      description: NegoLocalizations.of(context)?.registerDesc ?? 'Complete the account creation process and fill in your details',
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            InputEmail(controller: _emailController),
            const SizedBox(height: 20),
            InputPhone(controller: _phoneController),
            const SizedBox(height: 20),
            InputPassword(controller: _passwordController),
            const SizedBox(height: 20),
            BaseContainerButton(
              label: NegoLocalizations.of(context)?.create ?? 'Create',
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                if (widget.onPressed == null) return;
                widget.onPressed!(RegisterModel(
                  email: _emailController.text,
                  phone: _phoneController.text,
                  password: _passwordController.text,
                ));
              },
            ),
            const SizedBox(height: 20),
            const OrDivider(),
            GroupSocialButton(
              onPressedFacebook: widget.onPressedFacebook,
              onPressedGoogle: widget.onPressedGoogle,
              type: widget.groupSocialType,
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: NegoLocalizations.of(context)?.registerAlreadyHaveAccount ?? 'Do I already have an account?',
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(
                      text: NegoLocalizations.of(context)?.authentication ?? 'Authentication',
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: _loginRecognizer,
                    ),
                  ],
                ),
              ),
            ),
            LinkEnterWithoutAccount(pageNamedHome: widget.pageNamedHome),
          ],
        ),
      ),
    );
  }
}
