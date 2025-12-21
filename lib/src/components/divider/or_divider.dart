import 'package:flutter/material.dart';
import 'package:nego_design/l10n/nego_localizations.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 30,
      child: Stack(
          alignment: Alignment.center,
          children: [
            Divider(color: colorScheme.primary,),
            Container(
              color: colorScheme.onPrimary,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Center(
                child: Text(
                  NegoLocalizations.of(context)?.orDividerText ?? 'Or',
                ),
              ),
            ),
          ]
      ),
    );
  }
}
