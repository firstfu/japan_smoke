/// ============================================================================
/// 檔案名稱：loading_widget.dart
/// 檔案描述：載入狀態組件
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義各種載入狀態的顯示組件。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/app_colors.dart';

/// 載入指示器組件
///
/// 顯示圓形載入動畫。
class LoadingIndicator extends StatelessWidget {
  /// 指示器大小
  final double size;

  /// 指示器顏色
  final Color? color;

  /// 是否顯示文字
  final String? message;

  const LoadingIndicator({
    super.key,
    this.size = 40,
    this.color,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: color ?? AppColors.primary,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 骨架屏載入組件
///
/// 顯示閃爍的佔位內容。
class ShimmerLoading extends StatelessWidget {
  /// 子組件
  final Widget child;

  const ShimmerLoading({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondary,
      highlightColor: AppColors.surface,
      child: child,
    );
  }
}

/// 骨架屏卡片組件
class ShimmerCard extends StatelessWidget {
  /// 卡片高度
  final double height;

  /// 卡片寬度
  final double? width;

  /// 圓角半徑
  final double borderRadius;

  const ShimmerCard({
    super.key,
    this.height = 120,
    this.width,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        height: height,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// 骨架屏列表組件
class ShimmerList extends StatelessWidget {
  /// 項目數量
  final int itemCount;

  /// 項目高度
  final double itemHeight;

  /// 項目間距
  final double spacing;

  const ShimmerList({
    super.key,
    this.itemCount = 3,
    this.itemHeight = 100,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: index < itemCount - 1 ? spacing : 0),
          child: ShimmerCard(height: itemHeight),
        ),
      ),
    );
  }
}

/// 全頁載入組件
class FullPageLoading extends StatelessWidget {
  /// 載入訊息
  final String? message;

  const FullPageLoading({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingIndicator(
          size: 48,
          message: message ?? '載入中...',
        ),
      ),
    );
  }
}
