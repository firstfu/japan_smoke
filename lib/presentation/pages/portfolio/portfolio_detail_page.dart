/// ============================================================================
/// 檔案名稱：portfolio_detail_page.dart
/// 檔案描述：作品案例詳情頁面
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義作品案例詳情頁面，包含 Before/After 對比滑塊功能。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/datasources/local/app_data.dart';

/// 作品案例詳情頁面
class PortfolioDetailPage extends StatelessWidget {
  final String portfolioId;

  const PortfolioDetailPage({
    super.key,
    required this.portfolioId,
  });

  @override
  Widget build(BuildContext context) {
    final item = AppData.getPortfolioById(int.tryParse(portfolioId) ?? 0);

    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('案例詳情')),
        body: const Center(child: Text('找不到此案例')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('案例詳情'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Before/After 滑塊
            _BeforeAfterSlider(item: item),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.location,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.completedAt,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                        ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: 導航到聯絡頁面
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

/// Before/After 滑塊組件
class _BeforeAfterSlider extends StatefulWidget {
  final dynamic item;

  const _BeforeAfterSlider({required this.item});

  @override
  State<_BeforeAfterSlider> createState() => _BeforeAfterSliderState();
}

class _BeforeAfterSliderState extends State<_BeforeAfterSlider> {
  double _sliderPosition = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      color: AppColors.secondary,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final localPosition = box.globalToLocal(details.globalPosition);
          setState(() {
            _sliderPosition = (localPosition.dx / box.size.width).clamp(0.0, 1.0);
          });
        },
        child: Stack(
          children: [
            // After 圖片（底層）- 佔位
            Positioned.fill(
              child: Container(
                color: AppColors.primary.withValues(alpha: 0.3),
                child: const Center(
                  child: Text(
                    AppStrings.afterLabel,
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            // Before 圖片（上層，可裁切）- 佔位
            Positioned.fill(
              child: ClipRect(
                clipper: _SliderClipper(_sliderPosition),
                child: Container(
                  color: AppColors.accent.withValues(alpha: 0.3),
                  child: const Center(
                    child: Text(
                      AppStrings.beforeLabel,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // 分隔線
            Positioned(
              left: MediaQuery.of(context).size.width * _sliderPosition - 2,
              top: 0,
              bottom: 0,
              child: Container(
                width: 4,
                color: Colors.white,
                child: Center(
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.compare_arrows),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 滑塊裁切器
class _SliderClipper extends CustomClipper<Rect> {
  final double position;

  _SliderClipper(this.position);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * position, size.height);
  }

  @override
  bool shouldReclip(_SliderClipper oldClipper) {
    return position != oldClipper.position;
  }
}
