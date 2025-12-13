/// ============================================================================
/// 檔案名稱：performance_utils.dart
/// 檔案描述：效能優化工具
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案提供效能優化相關的工具和組件。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/app_colors.dart';

/// 圖片快取組件
///
/// 使用 cached_network_image 實現圖片快取和懶加載。
class CachedImage extends StatelessWidget {
  /// 圖片 URL
  final String imageUrl;

  /// 寬度
  final double? width;

  /// 高度
  final double? height;

  /// 填充模式
  final BoxFit fit;

  /// 圓角半徑
  final double? borderRadius;

  /// 佔位圖標
  final IconData placeholderIcon;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholderIcon = Icons.image,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => _buildError(),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: image,
      );
    }

    return image;
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.secondary,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildError() {
    return Container(
      width: width,
      height: height,
      color: AppColors.secondary,
      child: Center(
        child: Icon(
          placeholderIcon,
          size: 32,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

/// 延遲載入組件
///
/// 當組件進入可視區域時才載入內容。
class LazyLoadWidget extends StatefulWidget {
  /// 子組件建構器
  final WidgetBuilder builder;

  /// 佔位組件
  final Widget? placeholder;

  /// 預載入距離
  final double preloadDistance;

  const LazyLoadWidget({
    super.key,
    required this.builder,
    this.placeholder,
    this.preloadDistance = 100,
  });

  @override
  State<LazyLoadWidget> createState() => _LazyLoadWidgetState();
}

class _LazyLoadWidgetState extends State<LazyLoadWidget> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (visible) {
        if (visible && !_isLoaded) {
          setState(() {
            _isLoaded = true;
          });
        }
      },
      child: _isLoaded
          ? widget.builder(context)
          : widget.placeholder ?? const SizedBox.shrink(),
    );
  }
}

/// 可見性檢測組件
class VisibilityDetector extends StatefulWidget {
  /// 子組件
  final Widget child;

  /// 可見性變更回調
  final ValueChanged<bool> onVisibilityChanged;

  const VisibilityDetector({
    super.key,
    required this.child,
    required this.onVisibilityChanged,
  });

  @override
  State<VisibilityDetector> createState() => _VisibilityDetectorState();
}

class _VisibilityDetectorState extends State<VisibilityDetector> {
  final GlobalKey _key = GlobalKey();
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    final renderObject = _key.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero);
      final size = renderObject.size;
      final screenSize = MediaQuery.of(context).size;

      final isVisible = offset.dy + size.height > 0 &&
          offset.dy < screenSize.height &&
          offset.dx + size.width > 0 &&
          offset.dx < screenSize.width;

      if (isVisible != _isVisible) {
        _isVisible = isVisible;
        widget.onVisibilityChanged(isVisible);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _checkVisibility();
        return false;
      },
      child: Container(
        key: _key,
        child: widget.child,
      ),
    );
  }
}

/// 節流執行器
///
/// 限制函數的執行頻率。
class Throttler {
  final Duration delay;
  DateTime? _lastExecutionTime;

  Throttler({required this.delay});

  void run(VoidCallback action) {
    final now = DateTime.now();
    if (_lastExecutionTime == null ||
        now.difference(_lastExecutionTime!) >= delay) {
      _lastExecutionTime = now;
      action();
    }
  }
}

/// 防抖執行器
///
/// 延遲執行函數，連續觸發時只執行最後一次。
class Debouncer {
  final Duration delay;
  VoidCallback? _action;
  bool _isScheduled = false;

  Debouncer({required this.delay});

  void run(VoidCallback action) {
    _action = action;
    if (!_isScheduled) {
      _isScheduled = true;
      Future.delayed(delay, () {
        _isScheduled = false;
        _action?.call();
      });
    }
  }

  void cancel() {
    _action = null;
    _isScheduled = false;
  }
}

/// 記憶化組件
///
/// 僅在依賴項變更時重建子組件。
class MemoizedWidget extends StatefulWidget {
  /// 子組件建構器
  final Widget Function() builder;

  /// 依賴項列表
  final List<Object?> dependencies;

  const MemoizedWidget({
    super.key,
    required this.builder,
    required this.dependencies,
  });

  @override
  State<MemoizedWidget> createState() => _MemoizedWidgetState();
}

class _MemoizedWidgetState extends State<MemoizedWidget> {
  Widget? _cachedWidget;
  List<Object?>? _previousDependencies;

  @override
  Widget build(BuildContext context) {
    if (_cachedWidget == null || !_dependenciesEqual()) {
      _cachedWidget = widget.builder();
      _previousDependencies = List.from(widget.dependencies);
    }
    return _cachedWidget!;
  }

  bool _dependenciesEqual() {
    if (_previousDependencies == null) return false;
    if (_previousDependencies!.length != widget.dependencies.length) {
      return false;
    }
    for (int i = 0; i < widget.dependencies.length; i++) {
      if (_previousDependencies![i] != widget.dependencies[i]) {
        return false;
      }
    }
    return true;
  }
}
