import 'package:flutter/material.dart';
import 'package:nego_design/_import.dart';

class GroupSocialButton extends StatelessWidget {
  final Function()? onPressedGoogle;
  final Function()? onPressedFacebook;
  final GroupSocialType type;

  const GroupSocialButton({
    super.key,
    this.onPressedGoogle,
    this.onPressedFacebook,
    this.type = GroupSocialType.linear,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case GroupSocialType.circle:
        return Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (onPressedGoogle != null) ...[
                  CircleSocialLinkButton(
                    image: NegoAppImage.google,
                    onPressed: onPressedGoogle,
                  ),
                ],
                if (onPressedFacebook != null) ...[
                  const SizedBox(width: 20),
                  CircleSocialLinkButton(
                    image: NegoAppImage.facebook,
                    onPressed: onPressedFacebook,
                  ),
                ],
              ]
            ),
          ],
        );
      default:
        return Column(
          children: [
            if (onPressedGoogle != null) ...[
              const SizedBox(height: 20),
              SocialLinkButton(
                label:
                NegoLocalizations.of(context)?.enterWith('Google') ??
                    'Enter with Google',
                image: NegoAppImage.google,
                onPressed: onPressedGoogle,
              ),
            ],
            if (onPressedFacebook != null) ...[
              const SizedBox(height: 20),
              SocialLinkButton(
                label:
                NegoLocalizations.of(context)?.enterWith('Facebook') ?? 'Enter with Facebook',
                image: NegoAppImage.facebook,
                onPressed: onPressedFacebook,
              ),
            ],
          ],
        );
    }
  }
}
