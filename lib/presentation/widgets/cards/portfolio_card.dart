/// ============================================================================
/// 檔案名稱：portfolio_card.dart
/// 檔案描述：作品案例卡片組件
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義作品案例的卡片組件。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/portfolio_item_model.dart';

/// 作品案例卡片組件
///
/// 用於顯示單一作品案例的卡片。
class PortfolioCard extends StatelessWidget {
  /// 案例資料
  final PortfolioItemModel portfolio;

  /// 點擊回調
  final VoidCallback? onTap;

  /// 是否顯示完整資訊
  final bool showFullInfo;

  const PortfolioCard({
    super.key,
    required this.portfolio,
    this.onTap,
    this.showFullInfo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Before/After 預覽圖
            Container(
              width: double.infinity,
              height: 160,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.secondary, AppColors.primary],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Stack(
                children: [
                  // Before 區域
                  Positioned.fill(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: AppColors.secondary,
                            child: const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 32,
                                    color: AppColors.textMuted,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Before',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 2,
                          color: AppColors.textLight,
                        ),
                        Expanded(
                          child: Container(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            child: const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.image,
                                    size: 32,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'After',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 服務類型標籤
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        portfolio.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 內容區域
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    portfolio.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (showFullInfo) ...[
                    const SizedBox(height: 8),
                    Text(
                      portfolio.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    // 地點和完成時間
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          portfolio.location,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          portfolio.completedAt,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
