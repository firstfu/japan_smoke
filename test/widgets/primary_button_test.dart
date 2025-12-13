/// ============================================================================
/// 檔案名稱：primary_button_test.dart
/// 檔案描述：主要按鈕 Widget 測試
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案包含 PrimaryButton 的 Widget 測試。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:japan_smoke/presentation/widgets/buttons/primary_button.dart';

void main() {
  group('PrimaryButton', () {
    testWidgets('should display text correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PrimaryButton(text: '測試按鈕'),
          ),
        ),
      );

      expect(find.text('測試按鈕'), findsOneWidget);
    });

    testWidgets('should call onPressed when tapped', (tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: '點擊我',
              onPressed: () => wasTapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('點擊我'));
      await tester.pump();

      expect(wasTapped, true);
    });

    testWidgets('should not respond when disabled', (tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: '禁用按鈕',
              onPressed: null,
            ),
          ),
        ),
      );

      await tester.tap(find.text('禁用按鈕'));
      await tester.pump();

      expect(wasTapped, false);
    });

    testWidgets('should show loading indicator when isLoading is true',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: '載入中',
              isLoading: true,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('載入中'), findsNothing);
    });

    testWidgets('should display icon when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PrimaryButton(
              text: '帶圖標按鈕',
              icon: Icons.add,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('帶圖標按鈕'), findsOneWidget);
    });

    testWidgets('should fill width when fullWidth is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16),
              child: PrimaryButton(
                text: '全寬按鈕',
                fullWidth: true,
              ),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, double.infinity);
    });
  });
}
