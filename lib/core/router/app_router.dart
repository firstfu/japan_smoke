/// ============================================================================
/// 檔案名稱：app_router.dart
/// 檔案描述：Japan Smoke App GoRouter 路由配置
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式的路由配置，使用 GoRouter 實現聲明式導航。
/// 包含所有頁面的路由定義、巢狀路由和參數傳遞。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/services/services_page.dart';
import '../../presentation/pages/services/service_detail_page.dart';
import '../../presentation/pages/portfolio/portfolio_page.dart';
import '../../presentation/pages/portfolio/portfolio_detail_page.dart';
import '../../presentation/pages/blog/blog_page.dart';
import '../../presentation/pages/blog/blog_detail_page.dart';
import '../../presentation/pages/about/about_page.dart';
import '../../presentation/pages/faq/faq_page.dart';
import '../../presentation/pages/contact/contact_page.dart';
import '../../presentation/widgets/common/app_scaffold.dart';
import 'route_names.dart';

/// 全域導航鍵
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

/// GoRouter 配置
///
/// 使用 ShellRoute 包裝所有頁面，提供統一的 Scaffold 框架。
/// 支援底部導航列和側邊抽屜導航。
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RoutePaths.home,
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute 提供統一的頁面框架
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        // 首頁
        GoRoute(
          path: RoutePaths.home,
          name: RouteNames.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomePage(),
          ),
        ),

        // 服務頁面
        GoRoute(
          path: RoutePaths.services,
          name: RouteNames.services,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ServicesPage(),
          ),
          routes: [
            // 服務詳情頁
            GoRoute(
              path: ':id',
              name: RouteNames.serviceDetail,
              builder: (context, state) {
                final serviceId = state.pathParameters['id']!;
                return ServiceDetailPage(serviceId: serviceId);
              },
            ),
          ],
        ),

        // 作品案例頁面
        GoRoute(
          path: RoutePaths.portfolio,
          name: RouteNames.portfolio,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: PortfolioPage(),
          ),
          routes: [
            // 案例詳情頁
            GoRoute(
              path: ':id',
              name: RouteNames.portfolioDetail,
              builder: (context, state) {
                final portfolioId = state.pathParameters['id']!;
                return PortfolioDetailPage(portfolioId: portfolioId);
              },
            ),
          ],
        ),

        // 博客頁面
        GoRoute(
          path: RoutePaths.blog,
          name: RouteNames.blog,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: BlogPage(),
          ),
          routes: [
            // 博客詳情頁
            GoRoute(
              path: ':id',
              name: RouteNames.blogDetail,
              builder: (context, state) {
                final postId = state.pathParameters['id']!;
                return BlogDetailPage(postId: postId);
              },
            ),
          ],
        ),

        // 關於我們頁面
        GoRoute(
          path: RoutePaths.about,
          name: RouteNames.about,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AboutPage(),
          ),
        ),

        // 常見問題頁面
        GoRoute(
          path: RoutePaths.faq,
          name: RouteNames.faq,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FaqPage(),
          ),
        ),

        // 聯絡我們頁面
        GoRoute(
          path: RoutePaths.contact,
          name: RouteNames.contact,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ContactPage(),
          ),
        ),
      ],
    ),
  ],

  // 錯誤頁面
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            '頁面不存在',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            state.uri.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go(RoutePaths.home),
            child: const Text('返回首頁'),
          ),
        ],
      ),
    ),
  ),
);
