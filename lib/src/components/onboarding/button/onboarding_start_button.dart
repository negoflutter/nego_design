import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class OnboardingStartButton extends StatelessWidget {
  final Function()? onPressed;
  final Alignment alignment;
  final String label;
  const OnboardingStartButton({
    super.key,
    this.label = 'Get Started',
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
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5),
              Text(
                NegoLocalizations.of(context)?.getStarted ?? label,
                style: TextStyle(fontSize: 15, color: Colors.orange.shade50),
              ),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
