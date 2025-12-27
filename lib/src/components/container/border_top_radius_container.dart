import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

/// A scaffold wrapper with top rounded corners.
///
/// Provides a consistent layout using [BorderRadiusScaffold] with
/// predefined top corner radius of 50.
///
/// Example:
/// ```dart
/// BorderTopRadiusContainer(
///   title: 'Welcome',
///   description: 'Sign in to continue',
///   visibleBackButton: true,
///   child: LoginForm(),
/// )
/// ```
class BorderTopRadiusContainer extends StatelessWidget {
  /// The main content displayed below the header.
  final Widget child;

  /// Title text shown in the gradient header.
  final String title;

  /// Description text shown below the title.
  final String description;

  /// Whether to display the back button. Defaults to false.
  final bool visibleBackButton;

  /// Callback for back button press. Defaults to [Navigator.pop].
  final Function()? onBackButton;

  const BorderTopRadiusContainer({
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
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: child,
    );
  }
}