import 'package:flutter_test/flutter_test.dart';
import 'package:pixabay_list/app/view/app.dart';
import 'package:pixabay_list/app/view/app_view.dart';

void main() {
  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        const App(),
      );
      await tester.pump();
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
