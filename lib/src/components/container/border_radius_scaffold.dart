import 'package:flutter/material.dart';

/// A scaffold with gradient background and customizable content area radius.
///
/// Creates a full-screen gradient layout with a white content container
/// that can have custom border radius.
///
/// Example:
/// ```dart
/// BorderRadiusScaffold(
///   title: 'Profile',
///   description: 'Edit your information',
///   visibleBackButton: true,
///   radius: BorderRadius.vertical(top: Radius.circular(30)),
///   child: ProfileForm(),
/// )
/// ```
class BorderRadiusScaffold extends StatelessWidget {
  /// The main content displayed in the rounded container.
  final Widget child;

  /// Title text shown in the gradient header.
  final String title;

  /// Description text shown below the title.
  final String description;

  /// Whether to display the back button. Defaults to false.
  final bool visibleBackButton;

  /// Callback for back button press. Defaults to [Navigator.pop].
  final Function()? onBackButton;

  /// Border radius applied to the content container. Defaults to none.
  final BorderRadius? radius;

  const BorderRadiusScaffold({
    super.key,
    required this.child,
    required this.title,
    required this.description,
    this.visibleBackButton = false,
    this.onBackButton,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              colorScheme.primary.withAlpha(255),
              colorScheme.primary.withAlpha(200),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (visibleBackButton || onBackButton != null) ...[
              const SizedBox(height: 60),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: onBackButton ?? () { if (Navigator.canPop(context)) Navigator.pop(context); },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(height: 20),
            ] else ...[
              const SizedBox(height: 80),
            ],
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary,
                  borderRadius: radius,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}