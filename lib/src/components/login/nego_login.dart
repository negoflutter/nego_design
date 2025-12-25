import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class NegoLogin extends StatefulWidget {
  final Function(LoginModel model)? onPressed;
  final String? pageNamedForgetPassword;
  final String? pageNamedRegister;
  final String? pageNamedHome;

  const NegoLogin({
    super.key,
    this.onPressed,
    this.pageNamedHome,
    this.pageNamedRegister,
    this.pageNamedForgetPassword
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
    super.dispose();
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
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
                Navigator.pushNamed(context,widget.pageNamedForgetPassword!);
              },
              child: Text(NegoLocalizations.of(context)?.loginForgotPassword ?? 'Forgot my password?',
              ),
            ),
            const SizedBox(height: 10),
            BaseContainerButton(
              label: NegoLocalizations.of(context)?.enter ?? 'Enter',
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                if (widget.onPressed == null) return;
                widget.onPressed!( LoginModel(
                  emailOrPhone: _emailOrPhoneController.text,
                  password: _passwordController.text,
                ));
              },
            ),
            const SizedBox(height: 20),
            const OrDivider(),
            const SizedBox(height: 20),
            SocialLinkButton(
              label: NegoLocalizations.of(context)?.enterWith('Google') ?? 'Enter with Google',
              image: NegoAppImage.google,
            ),
            const SizedBox(height: 20),
            SocialLinkButton(
              label: NegoLocalizations.of(context)?.enterWith('Facebook') ?? 'Enter with Facebook',
              image: NegoAppImage.facebook,
            ),
            const SizedBox(height: 20),
            LinkNotHaveAccount(pageNamedRegister: widget.pageNamedRegister,),
            LinkEnterWithoutAccount(pageNamedHome: widget.pageNamedHome,)
          ],
        ),
      ),
    );
  }
}
