/// ============================================================================
/// 檔案名稱：service_card.dart
/// 檔案描述：服務卡片組件
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義服務項目的卡片組件。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/service_model.dart';

/// 服務卡片組件
///
/// 用於顯示單一服務項目的卡片。
class ServiceCard extends StatelessWidget {
  /// 服務資料
  final ServiceModel service;

  /// 點擊回調
  final VoidCallback? onTap;

  /// 是否為精簡模式
  final bool compact;

  const ServiceCard({
    super.key,
    required this.service,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return _buildCompactCard(context);
    }
    return _buildFullCard(context);
  }

  Widget _buildCompactCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getServiceIcon(service.id),
                  color: AppColors.primary,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service.shortDesc,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFullCard(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 圖片區域
            Container(
              width: double.infinity,
              height: 140,
              color: AppColors.secondary,
              child: Center(
                child: Icon(
                  _getServiceIcon(service.id),
                  size: 56,
                  color: AppColors.primary,
                ),
              ),
            ),
            // 內容區域
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.shortDesc,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  // 特色標籤
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: service.features.take(3).map((feature) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.accent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getServiceIcon(String serviceId) {
    switch (serviceId) {
      case 'roof-cleaning':
        return Icons.roofing;
      case 'exterior-painting':
        return Icons.format_paint;
      case 'waterproofing':
        return Icons.water_drop;
      case 'interior-painting':
        return Icons.home;
      default:
        return Icons.build;
    }
  }
}
