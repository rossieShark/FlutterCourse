import 'package:audio_player/screens/tab_bar/additional_widgets/go_router.dart';
import 'package:audio_player/screens/tab_bar/tab_bar_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AudioPlayerApp test', (WidgetTester tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();
    await tester.pumpWidget(AudioPlayerApp(
      router: router,
    ));

    /// Проверяем, что все нажимаемые элементы имеют размер минимум 48px на 48px /// для Android.
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));

    /// Проверяем, что все нажимаемые элементы имеют размер минимум 44px на 44px /// для iOS.
    await expectLater(tester, meetsGuideline(iOSTapTargetGuideline));

    /// Проверяет, что все интерактивные объекты имеют лейбы
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));

    /// Проверяет, все ли тексты внутри семантик нод удовлетворяют
    /// правилу 3:1 (размер 18 и больше)
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    handle.dispose();
  });
}
