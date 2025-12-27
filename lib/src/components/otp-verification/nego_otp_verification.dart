import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nego_design/_import.dart';

class NegoOtpVerification extends StatefulWidget {
  final Function(OtpVerificationModel model)? onPressed;
  final Function()? onResendOtp;
  final Function()? onBackButton;
  final bool visibleBackButton;
  final BaseContainerType containerType;
  final String? pageNamedHome;

  final bool showFieldAsBox;
  const NegoOtpVerification({
    super.key,
    this.pageNamedHome,
    this.onResendOtp,
    this.onBackButton,
    this.visibleBackButton = false,
    this.showFieldAsBox = false,
    this.onPressed,
    this.containerType = BaseContainerType.borderTop,
  });

  @override
  State<NegoOtpVerification> createState() => _NegoOtpVerificationState();
}

class _NegoOtpVerificationState extends State<NegoOtpVerification> {
  final _otpValueNotifier = ValueNotifier<String>('');
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _otpValueNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      type: widget.containerType,
      onBackButton: widget.onBackButton,
      visibleBackButton: widget.visibleBackButton,
      title: NegoLocalizations.of(context)?.otpVerificationTitle ?? 'Validation of the otp',
      description: NegoLocalizations.of(context)?.otpVerificationDesc ?? 'Check the OTP code sent to the email address or contact number provided',
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            RepaintBoundary(
              child: Lottie.asset(
                NegoAppImage.verificationCode,
                width: 200,
                height: 200,
                package: 'nego_design',
              ),
            ),
            const SizedBox(height: 10),
            InputOtp(
              onSubmit: (value) => _otpValueNotifier.value = value,
              onCodeChanged: (value) => _otpValueNotifier.value = value,
              showFieldAsBox: widget.showFieldAsBox,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: widget.onResendOtp,
              child: Text(NegoLocalizations.of(context)?.otpVerificationResendCode ?? 'Resend code',
              ),
            ),
            const SizedBox(height: 10),
            ValueListenableBuilder(
              valueListenable: _otpValueNotifier,
              builder: (context, value, child) {
                return BaseContainerButton(
                  isDisabled: value.length != 6,
                  label: NegoLocalizations.of(context)?.next ?? 'Next',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    if (widget.onPressed == null) return;
                    widget.onPressed!(OtpVerificationModel(
                      code: value,
                    ));
                  },
                );
              }
            ),
            const SizedBox(height: 10),
            LinkEnterWithoutAccount(pageNamedHome: widget.pageNamedHome),
          ],
        ),
      ),
    );
  }
}
