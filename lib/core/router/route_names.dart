/// ============================================================================
/// 檔案名稱：route_names.dart
/// 檔案描述：Japan Smoke App 路由名稱常量
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式的所有路由名稱常量，用於 GoRouter 導航。
/// 集中管理路由名稱，避免硬編碼字串。
/// ============================================================================

/// 路由名稱常量
///
/// 使用方式：
/// ```dart
/// context.goNamed(RouteNames.home);
/// context.pushNamed(RouteNames.serviceDetail, pathParameters: {'id': 'roof-cleaning'});
/// ```
abstract class RouteNames {
  // ============================================================================
  // 主要頁面路由
  // ============================================================================

  /// 首頁
  static const String home = 'home';

  /// 服務列表頁
  static const String services = 'services';

  /// 服務詳情頁
  static const String serviceDetail = 'service-detail';

  /// 作品案例列表頁
  static const String portfolio = 'portfolio';

  /// 案例詳情頁
  static const String portfolioDetail = 'portfolio-detail';

  /// 博客列表頁
  static const String blog = 'blog';

  /// 博客詳情頁
  static const String blogDetail = 'blog-detail';

  /// 關於我們頁
  static const String about = 'about';

  /// 常見問題頁
  static const String faq = 'faq';

  /// 聯絡我們頁
  static const String contact = 'contact';
}

/// 路由路徑常量
abstract class RoutePaths {
  // ============================================================================
  // 主要頁面路徑
  // ============================================================================

  /// 首頁路徑
  static const String home = '/';

  /// 服務列表路徑
  static const String services = '/services';

  /// 服務詳情路徑（含參數）
  static const String serviceDetail = '/services/:id';

  /// 作品案例列表路徑
  static const String portfolio = '/portfolio';

  /// 案例詳情路徑（含參數）
  static const String portfolioDetail = '/portfolio/:id';

  /// 博客列表路徑
  static const String blog = '/blog';

  /// 博客詳情路徑（含參數）
  static const String blogDetail = '/blog/:id';

  /// 關於我們路徑
  static const String about = '/about';

  /// 常見問題路徑
  static const String faq = '/faq';

  /// 聯絡我們路徑
  static const String contact = '/contact';
}
