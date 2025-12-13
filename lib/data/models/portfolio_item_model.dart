/// ============================================================================
/// 檔案名稱：portfolio_item_model.dart
/// 檔案描述：作品案例資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義作品案例的資料模型，包含案例標題、前後對比圖片、地點等資訊。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 作品案例資料模型
///
/// 包含作品案例的完整資訊，用於案例展示頁面和 Before/After 對比功能。
class PortfolioItemModel extends Equatable {
  /// 案例 ID
  final int id;

  /// 案例標題
  final String title;

  /// 案例描述
  final String description;

  /// 服務分類
  final String category;

  /// 施工地點
  final String location;

  /// 施工前圖片路徑
  final String beforeImage;

  /// 施工後圖片路徑
  final String afterImage;

  /// 完工日期
  final String completedAt;

  /// 建構函式
  const PortfolioItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.beforeImage,
    required this.afterImage,
    required this.completedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        location,
        beforeImage,
        afterImage,
        completedAt,
      ];

  /// 從 JSON 建立模型
  factory PortfolioItemModel.fromJson(Map<String, dynamic> json) {
    return PortfolioItemModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      beforeImage: json['beforeImage'] as String,
      afterImage: json['afterImage'] as String,
      completedAt: json['completedAt'] as String,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'beforeImage': beforeImage,
      'afterImage': afterImage,
      'completedAt': completedAt,
    };
  }
}
