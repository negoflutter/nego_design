import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class NegoResetPassword extends StatefulWidget {
  final Function(ResetPasswordModel model)? onPressed;
  final Function()? onBackButton;
  final BaseContainerType containerType;
  final bool visibleBackButton;
  final String? pageNamedLogin;
  final String? pageNamedHome;

  const NegoResetPassword({
    super.key,
    this.pageNamedLogin,
    this.onPressed,
    this.pageNamedHome,
    this.onBackButton,
    this.visibleBackButton = false,
    this.containerType = BaseContainerType.borderTop,
  });

  @override
  State<NegoResetPassword> createState() => _NegoResetPasswordState();
}

class _NegoResetPasswordState extends State<NegoResetPassword> {
  final _passwordValueNotifier = ValueNotifier<String>('');
  final _confirmValueNotifier = ValueNotifier<String>('');
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordValueNotifier.dispose();
    _confirmValueNotifier.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      type: widget.containerType,
      onBackButton: widget.onBackButton,
      visibleBackButton: widget.visibleBackButton,
      title: NegoLocalizations.of(context)?.resetPasswordTitle ?? 'Change password',
      description: NegoLocalizations.of(context)?.resetPasswordDesc ?? 'Fill in the details to change your password, save your password in a safe place, or activate one of our security methods',
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            InputPassword(
              controller: _passwordController,
              onChanged: (value) => _passwordValueNotifier.value = value,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder(
              valueListenable: _passwordValueNotifier,
              builder: (context, value, child) {
                final isMinLength = validatePassword6MinLength(value, context) == null;
                final isLetter = validatePassword1Letter(value, context) == null;
                final isSymbol = validatePassword1Symbol(value, context) == null;
                final isNumber = validatePassword1Number(value, context) == null;
                final isValidate = isMinLength && isLetter && isNumber && isSymbol;
                return Column(
                  children: [
                    InputConfirmPassword(
                      controller: _confirmController,
                      ref: _passwordController,
                      readOnly: !isValidate,
                      onChanged: (value) => _confirmValueNotifier.value = value,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        CheckListTile(
                          isChecked: isMinLength,
                          text: NegoLocalizations.of(context)?.resetPasswordMin6 ?? 'Minimum 6 characters',
                        ),
                        const SizedBox(height: 15),
                        CheckListTile(
                          isChecked: isLetter,
                          text: NegoLocalizations.of(context,)?.resetPassword1Letter ?? 'A capital letter',
                        ),
                        const SizedBox(height: 15),
                        CheckListTile(
                          isChecked: isSymbol,
                          text: NegoLocalizations.of(context,)?.resetPassword1Symbol ?? 'At least 1 symbol',
                        ),
                        const SizedBox(height: 15),
                        CheckListTile(
                          isChecked: isNumber,
                          text: NegoLocalizations.of(context)?.resetPassword1Number ?? 'At least 1 number',
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _confirmValueNotifier,
              builder: (context, value, child) {
                final isEqualConfirm = value.isNotEmpty && value == _passwordValueNotifier.value;

                return Column(
                  children: [
                    const SizedBox(height: 15),
                    CheckListTile(
                      isChecked: isEqualConfirm,
                      text: NegoLocalizations.of(context)?.resetPasswordEquals ?? 'Passwords are the same',
                    ),
                    const SizedBox(height: 20),
                    BaseContainerButton(
                      isDisabled: !isEqualConfirm,
                      label: NegoLocalizations.of(context)?.confirm ?? 'Confirm',
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        if (widget.onPressed == null) return;
                        widget.onPressed!(
                          ResetPasswordModel(
                            password: _passwordController.text,
                            confirm: _confirmController.text,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            LinkEnterWithoutAccount(pageNamedHome: widget.pageNamedHome),
          ],
        ),
      ),
    );
  }
}
