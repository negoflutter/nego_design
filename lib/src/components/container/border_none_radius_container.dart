import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

/// A scaffold wrapper with bottom rounded corners.
///
/// Provides a consistent layout using [BorderRadiusScaffold] with
/// predefined bottom corner radius of 50.
///
/// Example:
/// ```dart
/// BorderNoneRadiusContainer(
///   title: 'Settings',
///   description: 'Manage your preferences',
///   visibleBackButton: true,
///   child: SettingsContent(),
/// )
/// ```
class BorderNoneRadiusContainer extends StatelessWidget {
  /// The main content displayed below the header.
  final Widget child;

  /// Title text shown in the header.
  final String title;

  /// Description text shown below the title.
  final String description;

  /// Whether to display the back button. Defaults to false.
  final bool visibleBackButton;

  /// Callback for back button press. Defaults to [Navigator.pop].
  final Function()? onBackButton;

  const BorderNoneRadiusContainer({
    super.key,
    required this.child,
    required this.title,
    required this.description,
    this.visibleBackButton = false,
    this.onBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return BorderRadiusScaffold(
      title: title,
      description: description,
      visibleBackButton: visibleBackButton,
      onBackButton: onBackButton,
      radius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: child,
    );
  }
}