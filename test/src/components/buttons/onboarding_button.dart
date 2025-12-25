import 'package:flutter_test/flutter_test.dart';
import 'package:nego_design/_import.dart';

void main() {
  testWidgets(
    'OnboardingButton displays the provided label text',
        (tester) async {
      const customLabel = 'Custom Label';

      await tester.pumpWidget(
        NegoApp(
          home: OnboardingStartButton(label: customLabel),
        ),
      );

      expect(find.text(customLabel), findsOneWidget);
    },
  );
}
