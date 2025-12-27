import 'package:flutter/material.dart';
import 'package:nego_design/nego_design.dart';

/// A versatile scaffold with configurable corner radius styles.
///
/// Provides a unified API to switch between different border radius
/// configurations using [BaseContainerType].
///
/// Example:
/// ```dart
/// BaseContainer(
///   title: 'Welcome',
///   description: 'Choose your style',
///   type: BaseContainerType.borderTop,
///   visibleBackButton: true,
///   child: ContentWidget(),
/// )
/// ```
class BaseContainer extends StatelessWidget {
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

  /// Border radius style type. Defaults to [BaseContainerType.borderTop].
  final BaseContainerType type;

  const BaseContainer({
    super.key,
    required this.child,
    required this.title,
    required this.description,
    this.visibleBackButton = false,
    this.type = BaseContainerType.borderTop,
    this.onBackButton,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BaseContainerType.borderTop:
        return BorderTopRadiusContainer(
          title: title,
          description: description,
          visibleBackButton: visibleBackButton,
          onBackButton: onBackButton,
          child: child,
        );
      case BaseContainerType.borderNone:
        return BorderNoneRadiusContainer(
          title: title,
          description: description,
          visibleBackButton: visibleBackButton,
          onBackButton: onBackButton,
          child: child,
        );
      default:
        return BorderBottomRadiusContainer(
          title: title,
          description: description,
          visibleBackButton: visibleBackButton,
          onBackButton: onBackButton,
          child: child,
        );
    }
  }
}