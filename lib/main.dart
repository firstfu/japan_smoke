/// ============================================================================
/// 檔案名稱：main.dart
/// 檔案描述：應用程式入口點
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案為 Flutter 應用程式的入口點，負責初始化應用並啟動。
/// 使用 Riverpod 作為狀態管理解決方案。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

/// 應用程式入口函數
void main() {
  // 確保 Flutter 綁定已初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 使用 ProviderScope 包裝應用，啟用 Riverpod 狀態管理
  runApp(
    const ProviderScope(
      child: JapanSmokeApp(),
    ),
  );
}
