/// ============================================================================
/// 檔案名稱：section_header.dart
/// 檔案描述：區塊標題組件
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義頁面區塊的標題組件，包含主標題和副標題。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

/// 區塊標題組件
///
/// 用於顯示頁面各區塊的標題，支援主標題、副標題和操作按鈕。
class SectionHeader extends StatelessWidget {
  /// 主標題
  final String title;

  /// 副標題（可選）
  final String? subtitle;

  /// 操作按鈕文字（可選）
  final String? actionText;

  /// 操作按鈕點擊回調
  final VoidCallback? onActionTap;

  /// 是否置中對齊
  final bool centered;

  /// 自訂內邊距
  final EdgeInsetsGeometry? padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.actionText,
    this.onActionTap,
    this.centered = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: centered ? TextAlign.center : TextAlign.start,
                ),
              ),
              if (actionText != null && !centered)
                TextButton(
                  onPressed: onActionTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(actionText!),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: centered ? TextAlign.center : TextAlign.start,
            ),
          ],
        ],
      ),
    );
  }
}
