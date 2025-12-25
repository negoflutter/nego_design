import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class OnboardingScaffold extends StatelessWidget {
  final OnboardingBackgroundType backgroundType;
  final List<Widget> bottomWidgets;
  final List<Widget> topWidgets;
  final OnboardingModel model;

  const OnboardingScaffold({
    super.key,
    this.backgroundType = OnboardingBackgroundType.none,
    this.bottomWidgets = const [],
    this.topWidgets = const [],
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    switch (backgroundType) {
      case OnboardingBackgroundType.none:
        return ImageBackgroundContainer(
          image: model.image,
          child: _PageOnboardingContainer(
            key: key,
            model: model,
            topWidgets: topWidgets,
            bottomWidgets: bottomWidgets,
          ),
        );
      default:
        return ImageScaleTransactionContainer(
          image: model.image,
          child: _PageOnboardingContainer(
            key: key,
            model: model,
            topWidgets: topWidgets,
            bottomWidgets: bottomWidgets,
          ),
        );
    }
  }
}

class _PageOnboardingContainer extends StatelessWidget {
  final List<Widget> bottomWidgets;
  final List<Widget> topWidgets;
  final OnboardingModel model;

  const _PageOnboardingContainer({
    super.key,
    this.bottomWidgets = const [],
    this.topWidgets = const [],
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3, 0.9],
          colors: [Colors.black87, Colors.black12],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(9.0),
        child: Column(
          children: [
            if (topWidgets.isNotEmpty) ...[
              const SizedBox(height: 40),
              ...topWidgets,
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: bottomWidgets,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
