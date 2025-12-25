import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class NegoForgetPassword extends StatefulWidget {
  final Function(ForgetPasswordModel model)? onPressed;
  final String? pageNamedHome;

  const NegoForgetPassword({
    super.key, this.pageNamedHome,
    this.onPressed,
  });

  @override
  State<NegoForgetPassword> createState() => _NegoForgetPasswordState();
}

class _NegoForgetPasswordState extends State<NegoForgetPassword> {
  final _emailOrPhoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailOrPhoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return BaseContainer(
      title: NegoLocalizations.of(context)?.forgetPasswordTitle ?? 'Forgot my password',
      description: NegoLocalizations.of(context)?.forgetPasswordDesc ?? 'Initiates the password recovery process',
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            InputEmailOrPhone(controller: _emailOrPhoneController),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorScheme.outline.withAlpha(50),
              ),
              padding: EdgeInsets.all(15),
              child: Text(NegoLocalizations.of(context)?.forgetPasswordStepDesc ?? 'To complete the password recovery process, you must complete all of the steps below.'),
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  CheckListTile(text: NegoLocalizations.of(context)?.forgetPasswordValidateForm ?? 'Fill in the information'),
                  const SizedBox(height: 10),
                  CheckListTile(text: NegoLocalizations.of(context)?.forgetPasswordValidateOtp ?? 'OTP code validation'),
                  const SizedBox(height: 10),
                  CheckListTile(text: NegoLocalizations.of(context)?.forgetPasswordResetPassword ?? 'Changing your password')
                ],
              ),
            ),
            const SizedBox(height: 25),
            BaseContainerButton(
              label: NegoLocalizations.of(context)?.next ?? 'Next',
              onPressed: () {
                if (!_formKey.currentState!.validate()) return;
                if (widget.onPressed == null) return;
                widget.onPressed!( ForgetPasswordModel(
                  emailOrPhone: _emailOrPhoneController.text,
                ));
              },
            ),
            const SizedBox(height: 10),
            LinkEnterWithoutAccount(pageNamedHome: widget.pageNamedHome,)
          ],
        ),
      ),
    );
  }
}
