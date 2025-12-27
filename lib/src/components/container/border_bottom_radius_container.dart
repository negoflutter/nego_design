import 'package:flutter/material.dart';

/// A scaffold with a gradient header and rounded bottom corners.
///
/// Creates a two-section layout: a colored header with gradient and
/// a white content area below.
///
/// Example:
/// ```dart
/// BorderBottomRadiusContainer(
///   title: 'Welcome',
///   description: 'Sign in to continue',
///   visibleBackButton: true,
///   child: LoginForm(),
/// )
/// ```
class BorderBottomRadiusContainer extends StatelessWidget {
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

  const BorderBottomRadiusContainer({
    super.key,
    required this.child,
    required this.title,
    required this.description,
    this.visibleBackButton = false,
    this.onBackButton,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    colorScheme.primary.withAlpha(255),
                    colorScheme.primary.withAlpha(200),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    if (visibleBackButton || onBackButton != null) ...[
                      const SizedBox(height: 60),
                      Container(
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
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(color: colorScheme.onPrimary),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}