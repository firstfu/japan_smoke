/// ============================================================================
/// 檔案名稱：responsive_utils.dart
/// 檔案描述：響應式設計工具
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案提供響應式設計的輔助工具，包含螢幕尺寸判斷和自適應佈局。
/// ============================================================================

import 'package:flutter/material.dart';

/// 響應式斷點
class Breakpoints {
  /// 手機最大寬度
  static const double mobile = 599;

  /// 平板最大寬度
  static const double tablet = 1023;

  /// 桌面最小寬度
  static const double desktop = 1024;
}

/// 裝置類型
enum DeviceType {
  mobile,
  tablet,
  desktop,
}

/// 響應式工具類
class ResponsiveUtils {
  /// 獲取當前裝置類型
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= Breakpoints.mobile) {
      return DeviceType.mobile;
    } else if (width <= Breakpoints.tablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  /// 是否為手機
  static bool isMobile(BuildContext context) {
    return getDeviceType(context) == DeviceType.mobile;
  }

  /// 是否為平板
  static bool isTablet(BuildContext context) {
    return getDeviceType(context) == DeviceType.tablet;
  }

  /// 是否為桌面
  static bool isDesktop(BuildContext context) {
    return getDeviceType(context) == DeviceType.desktop;
  }

  /// 是否為橫向模式
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// 獲取螢幕寬度
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// 獲取螢幕高度
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// 根據螢幕寬度計算網格列數
  static int getGridCrossAxisCount(BuildContext context, {double minItemWidth = 300}) {
    final width = screenWidth(context);
    final count = (width / minItemWidth).floor();
    return count < 1 ? 1 : count;
  }

  /// 獲取自適應內邊距
  static EdgeInsets getAdaptivePadding(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return const EdgeInsets.all(16);
      case DeviceType.tablet:
        return const EdgeInsets.all(24);
      case DeviceType.desktop:
        return const EdgeInsets.all(32);
    }
  }

  /// 獲取內容最大寬度
  static double getContentMaxWidth(BuildContext context) {
    final deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.mobile:
        return double.infinity;
      case DeviceType.tablet:
        return 720;
      case DeviceType.desktop:
        return 1200;
    }
  }
}

/// 響應式佈局組件
class ResponsiveLayout extends StatelessWidget {
  /// 手機佈局
  final Widget mobile;

  /// 平板佈局（可選）
  final Widget? tablet;

  /// 桌面佈局（可選）
  final Widget? desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Breakpoints.tablet) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth > Breakpoints.mobile) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

/// 自適應容器組件
class AdaptiveContainer extends StatelessWidget {
  /// 子組件
  final Widget child;

  /// 是否置中
  final bool centered;

  /// 自訂最大寬度
  final double? maxWidth;

  /// 自訂內邊距
  final EdgeInsetsGeometry? padding;

  const AdaptiveContainer({
    super.key,
    required this.child,
    this.centered = true,
    this.maxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final contentMaxWidth = maxWidth ?? ResponsiveUtils.getContentMaxWidth(context);
    final adaptivePadding = padding ?? ResponsiveUtils.getAdaptivePadding(context);

    Widget content = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentMaxWidth),
      child: Padding(
        padding: adaptivePadding,
        child: child,
      ),
    );

    if (centered) {
      return Center(child: content);
    }
    return content;
  }
}
