/// ============================================================================
/// 檔案名稱：animation_utils.dart
/// 檔案描述：動畫效果工具
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案提供各種動畫效果的工具和組件。
/// ============================================================================

import 'package:flutter/material.dart';

/// 動畫常量
class AnimationConstants {
  /// 快速動畫時長
  static const Duration fast = Duration(milliseconds: 150);

  /// 標準動畫時長
  static const Duration normal = Duration(milliseconds: 300);

  /// 慢速動畫時長
  static const Duration slow = Duration(milliseconds: 500);

  /// 標準曲線
  static const Curve defaultCurve = Curves.easeInOut;

  /// 彈性曲線
  static const Curve bounceCurve = Curves.elasticOut;

  /// 加速曲線
  static const Curve accelerateCurve = Curves.easeIn;

  /// 減速曲線
  static const Curve decelerateCurve = Curves.easeOut;
}

/// 淡入動畫組件
class FadeInWidget extends StatefulWidget {
  /// 子組件
  final Widget child;

  /// 延遲時間
  final Duration delay;

  /// 動畫時長
  final Duration duration;

  /// 動畫曲線
  final Curve curve;

  const FadeInWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AnimationConstants.normal,
    this.curve = AnimationConstants.defaultCurve,
  });

  @override
  State<FadeInWidget> createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

/// 滑入動畫組件
class SlideInWidget extends StatefulWidget {
  /// 子組件
  final Widget child;

  /// 延遲時間
  final Duration delay;

  /// 動畫時長
  final Duration duration;

  /// 動畫曲線
  final Curve curve;

  /// 滑動方向
  final SlideDirection direction;

  /// 滑動距離
  final double offset;

  const SlideInWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AnimationConstants.normal,
    this.curve = AnimationConstants.defaultCurve,
    this.direction = SlideDirection.fromBottom,
    this.offset = 30,
  });

  @override
  State<SlideInWidget> createState() => _SlideInWidgetState();
}

class _SlideInWidgetState extends State<SlideInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _fadeAnimation = curvedAnimation;

    Offset beginOffset;
    switch (widget.direction) {
      case SlideDirection.fromLeft:
        beginOffset = Offset(-widget.offset / 100, 0);
        break;
      case SlideDirection.fromRight:
        beginOffset = Offset(widget.offset / 100, 0);
        break;
      case SlideDirection.fromTop:
        beginOffset = Offset(0, -widget.offset / 100);
        break;
      case SlideDirection.fromBottom:
        beginOffset = Offset(0, widget.offset / 100);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(curvedAnimation);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

/// 滑動方向
enum SlideDirection {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
}

/// 縮放動畫組件
class ScaleInWidget extends StatefulWidget {
  /// 子組件
  final Widget child;

  /// 延遲時間
  final Duration delay;

  /// 動畫時長
  final Duration duration;

  /// 動畫曲線
  final Curve curve;

  /// 起始縮放比例
  final double beginScale;

  const ScaleInWidget({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AnimationConstants.normal,
    this.curve = AnimationConstants.defaultCurve,
    this.beginScale = 0.8,
  });

  @override
  State<ScaleInWidget> createState() => _ScaleInWidgetState();
}

class _ScaleInWidgetState extends State<ScaleInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _fadeAnimation = curvedAnimation;
    _scaleAnimation = Tween<double>(
      begin: widget.beginScale,
      end: 1.0,
    ).animate(curvedAnimation);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}

/// 交錯動畫列表
class StaggeredAnimationList extends StatelessWidget {
  /// 子組件列表
  final List<Widget> children;

  /// 每個項目的延遲間隔
  final Duration staggerDelay;

  /// 動畫類型
  final AnimationType animationType;

  const StaggeredAnimationList({
    super.key,
    required this.children,
    this.staggerDelay = const Duration(milliseconds: 100),
    this.animationType = AnimationType.fadeSlide,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(children.length, (index) {
        final delay = Duration(milliseconds: staggerDelay.inMilliseconds * index);
        switch (animationType) {
          case AnimationType.fade:
            return FadeInWidget(
              delay: delay,
              child: children[index],
            );
          case AnimationType.slide:
            return SlideInWidget(
              delay: delay,
              child: children[index],
            );
          case AnimationType.scale:
            return ScaleInWidget(
              delay: delay,
              child: children[index],
            );
          case AnimationType.fadeSlide:
            return SlideInWidget(
              delay: delay,
              child: children[index],
            );
        }
      }),
    );
  }
}

/// 動畫類型
enum AnimationType {
  fade,
  slide,
  scale,
  fadeSlide,
}

/// 按鈕點擊效果
class TapScaleEffect extends StatefulWidget {
  /// 子組件
  final Widget child;

  /// 點擊回調
  final VoidCallback? onTap;

  /// 縮放比例
  final double scaleFactor;

  const TapScaleEffect({
    super.key,
    required this.child,
    this.onTap,
    this.scaleFactor = 0.95,
  });

  @override
  State<TapScaleEffect> createState() => _TapScaleEffectState();
}

class _TapScaleEffectState extends State<TapScaleEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AnimationConstants.fast,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleFactor,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: AnimationConstants.defaultCurve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
