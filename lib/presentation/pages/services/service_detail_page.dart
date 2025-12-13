/// ============================================================================
/// 檔案名稱：service_detail_page.dart
/// 檔案描述：服務詳情頁面
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義服務詳情頁面，展示單一服務的完整資訊。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/route_names.dart';
import '../../../data/datasources/local/app_data.dart';

/// 服務詳情頁面
class ServiceDetailPage extends StatelessWidget {
  final String serviceId;

  const ServiceDetailPage({
    super.key,
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    final service = AppData.getServiceById(serviceId);

    if (service == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('服務詳情')),
        body: const Center(child: Text('找不到此服務')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(service.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 圖片區域
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                image: DecorationImage(
                  image: AssetImage(service.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 標題
                  Text(
                    service.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.titleEn,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textMuted,
                        ),
                  ),

                  const SizedBox(height: 24),

                  // 描述
                  Text(
                    service.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                        ),
                  ),

                  const SizedBox(height: 32),

                  // 服務特色
                  Text(
                    '服務特色',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ...service.features.map((feature) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.check,
                              color: AppColors.accent,
                              size: 16,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              feature,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 32),

                  // CTA 按鈕
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.goNamed(RouteNames.contact);
                      },
                      icon: const Icon(Icons.calendar_today),
                      label: const Text(AppStrings.btnBookNow),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
