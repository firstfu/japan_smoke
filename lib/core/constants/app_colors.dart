/// ============================================================================
/// 檔案名稱：app_colors.dart
/// 檔案描述：Japan Smoke App 顏色常量定義
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式使用的所有顏色常量，基於塗新居品牌設計系統。
/// 包含主要色彩、功能色、文字色、背景色等。
/// ============================================================================

import 'package:flutter/material.dart';

/// 應用程式顏色常量
///
/// 使用方式：
/// ```dart
/// Container(
///   color: AppColors.primary,
///   child: Text(
///     '文字',
///     style: TextStyle(color: AppColors.textLight),
///   ),
/// )
/// ```
abstract class AppColors {
  // ============================================================================
  // 主要色彩
  // ============================================================================

  /// 主色 - 深藍色
  /// 用於：AppBar、主要按鈕、標題文字
  static const Color primary = Color(0xFF1A1B4B);

  /// 主色（淺）
  static const Color primaryLight = Color(0xFF2D2E6B);

  /// 主色（深）
  static const Color primaryDark = Color(0xFF0F1030);

  // ============================================================================
  // 次要色彩
  // ============================================================================

  /// 次色 - 淺紫色
  /// 用於：背景、卡片底色、次要元素
  static const Color secondary = Color(0xFFE8E6F0);

  /// 次色（淺）
  static const Color secondaryLight = Color(0xFFF5F4F8);

  /// 次色（深）
  static const Color secondaryDark = Color(0xFFD4D1E0);

  // ============================================================================
  // 強調色
  // ============================================================================

  /// 強調色 - 金黃色
  /// 用於：CTA 按鈕、重要標記、高亮顯示
  static const Color accent = Color(0xFFF5C842);

  /// 強調色（淺）
  static const Color accentLight = Color(0xFFFFDA6A);

  /// 強調色（深）
  static const Color accentDark = Color(0xFFD4A520);

  // ============================================================================
  // 功能色
  // ============================================================================

  /// 成功色 - 綠色
  static const Color success = Color(0xFF4CAF50);

  /// 錯誤色 - 紅色
  static const Color error = Color(0xFFE53935);

  /// 警告色 - 橙色
  static const Color warning = Color(0xFFFF9800);

  /// 資訊色 - 藍色
  static const Color info = Color(0xFF2196F3);

  // ============================================================================
  // 文字色彩
  // ============================================================================

  /// 主要文字色 - 深色
  static const Color textPrimary = Color(0xFF1A1B4B);

  /// 次要文字色 - 中灰
  static const Color textSecondary = Color(0xFF5A5B7B);

  /// 靜音文字色 - 淺灰
  static const Color textMuted = Color(0xFF8A8BA0);

  /// 淺色文字 - 白色
  static const Color textLight = Color(0xFFFFFFFF);

  // ============================================================================
  // 背景色彩
  // ============================================================================

  /// 主要背景色
  static const Color background = Color(0xFFFAFAFA);

  /// 替代背景色
  static const Color backgroundAlt = Color(0xFFF0EEF5);

  /// 卡片背景色
  static const Color surface = Color(0xFFFFFFFF);

  // ============================================================================
  // 邊框色彩
  // ============================================================================

  /// 主要邊框色
  static const Color border = Color(0xFFE0DFE8);

  /// 淺色邊框
  static const Color borderLight = Color(0xFFF0EFF5);

  // ============================================================================
  // 陰影色彩
  // ============================================================================

  /// 陰影色
  static const Color shadow = Color(0x1A1A1B4B);

  // ============================================================================
  // 漸層
  // ============================================================================

  /// 主要漸層（深藍到淺藍）
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  /// 強調漸層（金黃色）
  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentLight, accent],
  );

  /// Hero 區塊漸層（帶透明度）
  static const LinearGradient heroOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x001A1B4B),
      Color(0xCC1A1B4B),
    ],
  );
}
