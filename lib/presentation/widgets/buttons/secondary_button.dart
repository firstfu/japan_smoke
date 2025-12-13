/// ============================================================================
/// 檔案名稱：secondary_button.dart
/// 檔案描述：次要按鈕組件
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式的次要按鈕組件，用於輔助操作。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// 次要按鈕組件
///
/// 用於輔助操作，如取消、返回等。
class SecondaryButton extends StatelessWidget {
  /// 按鈕文字
  final String text;

  /// 點擊回調
  final VoidCallback? onPressed;

  /// 是否載入中
  final bool isLoading;

  /// 按鈕圖標（可選）
  final IconData? icon;

  /// 是否佔滿寬度
  final bool fullWidth;

  /// 自訂內邊距
  final EdgeInsetsGeometry? padding;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.fullWidth = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            )
          : icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                    Text(text),
                  ],
                )
              : Text(text),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
