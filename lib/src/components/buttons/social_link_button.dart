import 'package:flutter/material.dart';

class SocialLinkButton extends StatelessWidget {
  final String label;
  final String image;

  const SocialLinkButton({super.key, required this.label, required this.image});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        backgroundColor: colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 20, height: 20, package: 'nego_design',),
          const SizedBox(width: 20),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
