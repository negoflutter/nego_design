import 'package:flutter/material.dart';

class BaseContainerButton extends StatelessWidget {
  final Function()? onPressed;

  final EdgeInsetsGeometry? padding;
  final Alignment alignment;
  final String label;
  const BaseContainerButton({
    super.key,
    this.label = 'Confirm',
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    this.alignment = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: colorScheme.primary,
        ),
        child: Text(label),
      ),
    );
  }
}
