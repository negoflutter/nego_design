import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class PageItemIndicateNumberOnboarding extends StatelessWidget {
  final OnboardingBackgroundType backgroundType;
  final OnboardingIndicatorType indicatorType;
  final OnboardingButtonType buttonType;
  final MainAxisAlignment alignmentIndicator;
  final Alignment alignmentButton;
  final OnboardingModel model;
  final Function()? onPressed;
  final int length;
  final int index;

  const PageItemIndicateNumberOnboarding({
    super.key,
    required this.model,
    required this.index,
    required this.length,
    this.alignmentButton = Alignment.bottomLeft,
    this.alignmentIndicator = MainAxisAlignment.end,
    this.backgroundType = OnboardingBackgroundType.none,
    this.indicatorType = OnboardingIndicatorType.numbers,
    this.buttonType = OnboardingButtonType.arrowText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      key: key,
      model: model,
      backgroundType: backgroundType,
      topWidgets: [
        if (indicatorType == OnboardingIndicatorType.numbers)
          _RowIndicatorNumber(position: index, length: length, alignmentIndicator: alignmentIndicator),
      ],
      bottomWidgets: [
        if (indicatorType == OnboardingIndicatorType.divisors)
          _RowIndicatorDiv(
            position: index,
            length: length,
            alignmentIndicator: alignmentIndicator,
          ),

        FadeAnimation(
          key: ValueKey('fade_title_$index'),
          delay: 10,
          child: Text(
            model.title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        FadeAnimation(
          key: ValueKey('fade_description_$index'),
          delay: 50,
          child: Text(
            model.description,
            style: TextStyle(fontSize: 15, color: Colors.white, height: 1.9),
          ),
        ),
        FadeAnimation(
          key: ValueKey('fade_button_$index'),
          delay: 90,
          child: OnboardingButton(
            alignment: alignmentButton,
            buttonType: buttonType,
            onPressed: onPressed ?? model.onPressed,
          ),
        ),
      ],
    );
  }
}

class _RowIndicatorNumber extends StatelessWidget {
  final MainAxisAlignment alignmentIndicator;
  final int position;
  final int length;
  const _RowIndicatorNumber({required this.position, required this.length, required this.alignmentIndicator});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignmentIndicator,
      children: [
        Text('$position', style: TextStyle(fontSize: 30, color: Colors.white)),
        Text('/$length', style: TextStyle(fontSize: 15, color: Colors.white)),
      ],
    );
  }
}

class _RowIndicatorDiv extends StatelessWidget {
  final MainAxisAlignment alignmentIndicator;
  final int position;
  final int length;
  const _RowIndicatorDiv({
    required this.position,
    required this.length,
    required this.alignmentIndicator,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 10,
      child: Row(
        mainAxisAlignment: alignmentIndicator,
        children: List.generate(length, (index) {
          final isActive = index == position - 1;
          return Padding(
            padding: EdgeInsets.only(left: index > 0 ? 10 : 0),
            child: Container(
              height: 13,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorScheme.secondary),
                color: isActive
                    ? colorScheme.primary
                    : colorScheme.primary.withAlpha(125),
              ),
            ),
          );
        }),
      ),
    );
  }
}
