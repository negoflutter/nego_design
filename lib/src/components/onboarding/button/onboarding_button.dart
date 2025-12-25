import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class OnboardingButton extends StatelessWidget {
  final Function()? onPressed;
  final OnboardingButtonType buttonType;
  final Alignment alignment;
  final String label;
  const OnboardingButton({
    super.key,
    this.label = 'Get Started',
    this.onPressed,
    this.alignment = Alignment.bottomRight,
    this.buttonType = OnboardingButtonType.arrowText,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case OnboardingButtonType.arrowText:
        return OnboardingStartButton(
          onPressed: onPressed,
          alignment: alignment,
          label: label,
        );
      default:
        return OnboardingArrowButton(
          onPressed: onPressed,
          alignment: alignment,
        );
    }
  }
}
