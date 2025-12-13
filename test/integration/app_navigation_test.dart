/// ============================================================================
/// 檔案名稱：app_navigation_test.dart
/// 檔案描述：應用導航整合測試
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案包含應用程式導航功能的整合測試。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:japan_smoke/app.dart';

void main() {
  group('App Navigation Integration Tests', () {
    testWidgets('should launch app successfully', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: JapanSmokeApp(),
        ),
      );

      await tester.pumpAndSettle();

      // 驗證應用啟動成功
      expect(find.byType(JapanSmokeApp), findsOneWidget);
    });

    testWidgets('should display scaffold', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: JapanSmokeApp(),
        ),
      );

      await tester.pumpAndSettle(const Duration(seconds: 3));

      // 驗證 Scaffold 存在
      expect(find.byType(Scaffold), findsWidgets);
    });
  });
}
