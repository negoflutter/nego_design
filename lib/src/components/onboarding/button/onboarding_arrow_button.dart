import 'package:flutter/material.dart';

class OnboardingArrowButton extends StatelessWidget {
  final Function()? onPressed;
  final Alignment alignment;
  const OnboardingArrowButton({
    super.key,
    this.onPressed,
    this.alignment = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Align(
      alignment: alignment,
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.arrow_forward_outlined,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
