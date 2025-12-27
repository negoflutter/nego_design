import 'package:flutter/material.dart';

/// A button for social login with an icon and label.
///
/// Displays an outlined button with a social media icon and text label.
/// The icon is loaded from the `nego_design` package.
///
/// Example:
/// ```dart
/// CircleSocialLinkButton(
///   image: 'assets/google_icon.png',
/// )
/// ```
class CircleSocialLinkButton extends StatelessWidget {
  /// Callback when the form is submitted with valid data.
  final Function()? onPressed;
  /// Text displayed next to the icon.
  final String image;
  /// Creates a social login button.
  const CircleSocialLinkButton({
    super.key,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        shape: const CircleBorder(),
        backgroundColor: colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Image.asset(
        image,
        width: 20,
        height: 20,
        package: 'nego_design',
      ),
    );
  }
}