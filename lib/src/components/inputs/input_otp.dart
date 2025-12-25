import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class InputOtp extends StatelessWidget {
  final Function(String verificationCode)? onSubmit;
  final Function(String code)? onCodeChanged;
  final int numberOfFields;

  final bool showFieldAsBox;
  const InputOtp({
    super.key,
    this.onSubmit,
    this.onCodeChanged,
    this.numberOfFields = 6,
    this.showFieldAsBox = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return OtpTextField(
      borderRadius: BorderRadius.circular(50),
      contentPadding: EdgeInsets.all(10),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      borderColor: colorScheme.primary,
      showFieldAsBox: showFieldAsBox,
      numberOfFields: numberOfFields,
      onCodeChanged: onCodeChanged,
      onSubmit: onSubmit,
    );
  }
}
