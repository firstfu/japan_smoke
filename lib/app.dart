/// ============================================================================
/// 檔案名稱：app.dart
/// 檔案描述：應用程式主要配置
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義 MaterialApp 配置，包含路由、主題等設定。
/// ============================================================================

import 'package:flutter/material.dart';

import 'core/constants/app_strings.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

/// Japan Smoke 應用程式主體
class JapanSmokeApp extends StatelessWidget {
  const JapanSmokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // 應用名稱
      title: AppStrings.appName,

      // 路由配置
      routerConfig: appRouter,

      // 主題配置
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,

      // 除錯配置
      debugShowCheckedModeBanner: false,
    );
  }
}
