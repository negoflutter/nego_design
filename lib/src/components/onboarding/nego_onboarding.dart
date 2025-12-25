import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class NegoOnboarding extends StatefulWidget {
  final OnboardingBackgroundType backgroundType;
  final OnboardingIndicatorType indicatorType;
  final OnboardingButtonType buttonType;
  final MainAxisAlignment alignmentIndicator;
  final List<OnboardingModel> models;
  final Alignment alignmentButton;
  final Function()? onPressed;

  const NegoOnboarding({
    super.key,
    this.buttonType = OnboardingButtonType.arrowText,
    this.indicatorType = OnboardingIndicatorType.numbers,
    this.backgroundType = OnboardingBackgroundType.none,
    this.alignmentIndicator = MainAxisAlignment.end,
    this.alignmentButton = Alignment.bottomRight,
    this.models = const [],
    this.onPressed,
  });

  @override
  State<NegoOnboarding> createState() => _NegoOnboardingState();
}

class _NegoOnboardingState extends State<NegoOnboarding> {
  final PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {},
        children: List.generate(
          widget.models.length,
          (index) => PageItemIndicateNumberOnboarding(
            key: ValueKey('onboarding_page_$index'),
            alignmentIndicator: widget.alignmentIndicator,
            buttonType: widget.buttonType,
            alignmentButton: widget.alignmentButton,
            backgroundType: widget.backgroundType,
            indicatorType: widget.indicatorType,
            onPressed: widget.onPressed,
            model: widget.models[index],
            length: widget.models.length,
            index: index + 1,
          ),
        ),
      ),
    );
  }
}
