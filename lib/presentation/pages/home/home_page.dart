/// ============================================================================
/// 檔案名稱：home_page.dart
/// 檔案描述：首頁主體
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式的首頁，整合 Hero 區塊、服務預覽、案例預覽、
/// 客戶評價、CTA 等多個區塊組件。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/datasources/local/app_data.dart';

/// 首頁
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              // TODO: 撥打電話
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero 區塊
            _buildHeroSection(context),

            // 服務概覽
            _buildServicesSection(context),

            // 統計數據
            _buildStatsSection(context),

            // 案例預覽
            _buildPortfolioSection(context),

            // 客戶評價
            _buildTestimonialsSection(context),

            // CTA 區塊
            _buildCtaSection(context),
          ],
        ),
      ),
    );
  }

  /// Hero 區塊
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.heroTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.heroSubtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textLight.withValues(alpha: 0.9),
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: 導航到聯絡頁面
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text(AppStrings.btnBookNow),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: 撥打電話
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textLight,
                    side: const BorderSide(color: AppColors.textLight),
                  ),
                  icon: const Icon(Icons.phone),
                  label: const Text(AppStrings.btnCallNow),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // 信任徽章
            Row(
              children: [
                _buildTrustBadge(
                  icon: Icons.verified,
                  text: '${AppData.company.satisfactionRate}% 滿意度',
                ),
                const SizedBox(width: 16),
                _buildTrustBadge(
                  icon: Icons.location_on,
                  text: AppData.company.region,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 信任徽章
  Widget _buildTrustBadge({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accent, size: 18),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textLight,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 服務概覽區塊
  Widget _buildServicesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.sectionServices,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: AppData.services.length,
            itemBuilder: (context, index) {
              final service = AppData.services[index];
              return _buildServiceCard(context, service);
            },
          ),
        ],
      ),
    );
  }

  /// 服務卡片
  Widget _buildServiceCard(BuildContext context, service) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: 導航到服務詳情
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getServiceIcon(service.icon),
                  color: AppColors.accent,
                  size: 28,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                service.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  service.shortDesc,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    AppStrings.btnReadMore,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 取得服務圖示
  IconData _getServiceIcon(String iconName) {
    switch (iconName) {
      case 'droplets':
        return Icons.water_drop;
      case 'paintbrush':
        return Icons.brush;
      case 'roller':
        return Icons.format_paint;
      case 'shield':
        return Icons.shield;
      default:
        return Icons.build;
    }
  }

  /// 統計數據區塊
  Widget _buildStatsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: AppColors.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            context,
            value: '${AppData.company.satisfactionRate}%',
            label: AppStrings.satisfactionRate,
          ),
          _buildStatItem(
            context,
            value: '10+',
            label: AppStrings.yearsExperience,
          ),
          _buildStatItem(
            context,
            value: '500+',
            label: AppStrings.completedProjects,
          ),
        ],
      ),
    );
  }

  /// 統計項目
  Widget _buildStatItem(
    BuildContext context, {
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  /// 案例預覽區塊
  Widget _buildPortfolioSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.sectionPortfolio,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {
                  // TODO: 導航到案例頁面
                },
                child: const Text(AppStrings.btnViewAll),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: AppData.portfolioItems.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = AppData.portfolioItems[index];
                return _buildPortfolioCard(context, item);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 案例卡片
  Widget _buildPortfolioCard(BuildContext context, item) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 圖片區域（佔位）
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.compare,
                    size: 32,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${AppStrings.beforeLabel} / ${AppStrings.afterLabel}',
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.location,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 客戶評價區塊
  Widget _buildTestimonialsSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: AppColors.backgroundAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.sectionTestimonials,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: AppData.testimonials.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final testimonial = AppData.testimonials[index];
                return _buildTestimonialCard(context, testimonial);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 評價卡片
  Widget _buildTestimonialCard(BuildContext context, testimonial) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 星星評分
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < testimonial.rating ? Icons.star : Icons.star_border,
                color: AppColors.accent,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              testimonial.content,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primary,
                child: Text(
                  testimonial.name[0],
                  style: const TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      testimonial.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '${testimonial.title} · ${testimonial.location}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// CTA 區塊
  Widget _buildCtaSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Column(
        children: [
          Text(
            '準備好讓您的房屋煥然一新了嗎？',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.textLight,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            '立即預約免費評估，我們會在 24 小時內與您聯絡',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textLight.withValues(alpha: 0.9),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: 導航到聯絡頁面
            },
            icon: const Icon(Icons.calendar_today),
            label: const Text(AppStrings.btnFreeQuote),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
