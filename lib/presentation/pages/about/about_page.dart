/// ============================================================================
/// 檔案名稱：about_page.dart
/// 檔案描述：關於我們頁面
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義關於我們頁面，展示公司介紹和團隊成員。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/datasources/local/app_data.dart';
import '../../../data/models/team_member_model.dart';

/// 關於我們頁面
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.navAbout),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 公司介紹
            _buildAboutSection(context),

            // 服務地區
            _buildRegionsSection(context),

            // 團隊成員
            _buildTeamSection(context),

            // 聯絡資訊
            _buildContactSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.aboutTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textLight,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.aboutDescription,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textLight.withValues(alpha: 0.9),
                  height: 1.8,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '服務地區',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text(
            '${AppData.company.region}及周邊地區',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: AppData.company.subRegions.map((region) {
              return Chip(
                label: Text(region),
                backgroundColor: AppColors.secondary,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: AppColors.backgroundAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.sectionTeam,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ...AppData.teamMembers.map((member) {
            return _buildTeamMemberCard(context, member);
          }),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(BuildContext context, TeamMemberModel member) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.primary,
              child: Text(
                member.name[0],
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    member.role,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    member.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '聯絡資訊',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _buildContactItem(
            context,
            icon: Icons.phone,
            title: '電話',
            content: AppData.company.phone,
          ),
          const SizedBox(height: 12),
          _buildContactItem(
            context,
            icon: Icons.access_time,
            title: '營業時間',
            content: AppData.company.hours,
          ),
          const SizedBox(height: 12),
          _buildContactItem(
            context,
            icon: Icons.location_on,
            title: '服務地區',
            content: AppData.company.region,
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                content,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
