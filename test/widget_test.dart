/// ============================================================================
/// 檔案名稱：widget_test.dart
/// 檔案描述：Japan Smoke App Widget 測試
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案包含應用程式的 Widget 測試。
/// ============================================================================

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:paint/app.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: JapanSmokeApp(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify the app launched (basic smoke test)
    expect(find.byType(JapanSmokeApp), findsOneWidget);
  });
}
