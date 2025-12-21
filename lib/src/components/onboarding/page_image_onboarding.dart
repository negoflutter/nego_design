import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class PageImageOnboarding extends StatefulWidget {
  final PageBackgroundType backgroundType;
  final List<OnboardingModel> models;
  final Alignment alignmentButton;
  final Function()? onPressed;

  const PageImageOnboarding({
    super.key,
    this.models = const [],
    this.backgroundType = PageBackgroundType.none,
    this.alignmentButton = Alignment.bottomRight,
    this.onPressed,
  });

  @override
  State<PageImageOnboarding> createState() => _PageImageOnboardingState();
}

class _PageImageOnboardingState extends State<PageImageOnboarding> {
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
            alignmentButton: widget.alignmentButton,
            backgroundType: widget.backgroundType,
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
