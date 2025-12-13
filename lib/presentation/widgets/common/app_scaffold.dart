/// ============================================================================
/// 檔案名稱：app_scaffold.dart
/// 檔案描述：應用程式統一頁面框架
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式的統一頁面框架，包含底部導航列和側邊抽屜。
/// 作為 ShellRoute 的 builder，為所有頁面提供一致的導航結構。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/router/route_names.dart';

/// 應用程式統一頁面框架
///
/// 提供底部導航列和側邊抽屜導航，包裝所有子頁面。
class AppScaffold extends StatelessWidget {
  /// 子頁面內容
  final Widget child;

  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _buildBottomNavBar(context),
      drawer: _buildDrawer(context),
    );
  }

  /// 建構底部導航列
  Widget _buildBottomNavBar(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: AppStrings.navHome,
                route: RoutePaths.home,
                isActive: currentLocation == RoutePaths.home,
              ),
              _buildNavItem(
                context,
                icon: Icons.build_outlined,
                activeIcon: Icons.build,
                label: AppStrings.navServices,
                route: RoutePaths.services,
                isActive: currentLocation.startsWith('/services'),
              ),
              _buildNavItem(
                context,
                icon: Icons.photo_library_outlined,
                activeIcon: Icons.photo_library,
                label: AppStrings.navPortfolio,
                route: RoutePaths.portfolio,
                isActive: currentLocation.startsWith('/portfolio'),
              ),
              _buildNavItem(
                context,
                icon: Icons.article_outlined,
                activeIcon: Icons.article,
                label: AppStrings.navBlog,
                route: RoutePaths.blog,
                isActive: currentLocation.startsWith('/blog'),
              ),
              _buildNavItem(
                context,
                icon: Icons.phone_outlined,
                activeIcon: Icons.phone,
                label: AppStrings.navContact,
                route: RoutePaths.contact,
                isActive: currentLocation == RoutePaths.contact,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 建構單一導航項目
  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required String route,
    required bool isActive,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary.withValues(alpha: 0.1) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? AppColors.primary : AppColors.textMuted,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? AppColors.primary : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 建構側邊抽屜
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // 標頭
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.appName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textLight,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppStrings.appSlogan,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textLight.withValues(alpha: 0.8),
                        ),
                  ),
                ],
              ),
            ),

            // 選單項目
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home,
                    label: AppStrings.navHome,
                    route: RoutePaths.home,
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.build,
                    label: AppStrings.navServices,
                    route: RoutePaths.services,
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.photo_library,
                    label: AppStrings.navPortfolio,
                    route: RoutePaths.portfolio,
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.article,
                    label: AppStrings.navBlog,
                    route: RoutePaths.blog,
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.info,
                    label: AppStrings.navAbout,
                    route: RoutePaths.about,
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.help,
                    label: AppStrings.navFaq,
                    route: RoutePaths.faq,
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.phone,
                    label: AppStrings.navContact,
                    route: RoutePaths.contact,
                  ),
                ],
              ),
            ),

            // 底部資訊
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.companyPhone,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 20,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppStrings.companyHours,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 建構抽屜選單項目
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final isActive = currentLocation == route ||
        (route != RoutePaths.home && currentLocation.startsWith(route));

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: isActive ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
      selected: isActive,
      selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
      onTap: () {
        Navigator.pop(context);
        context.go(route);
      },
    );
  }
}
