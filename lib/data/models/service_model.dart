/// ============================================================================
/// 檔案名稱：service_model.dart
/// 檔案描述：服務項目資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義服務項目的資料模型，包含服務名稱、描述、特色、圖片等資訊。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 服務項目資料模型
///
/// 包含單一服務的完整資訊，用於服務列表和詳情頁面展示。
class ServiceModel extends Equatable {
  /// 服務 ID（唯一識別碼）
  final String id;

  /// 服務名稱
  final String title;

  /// 服務英文名稱
  final String titleEn;

  /// 服務簡短描述
  final String shortDesc;

  /// 服務完整描述
  final String description;

  /// 服務特色列表
  final List<String> features;

  /// 圖示名稱
  final String icon;

  /// 圖片路徑
  final String image;

  /// 建構函式
  const ServiceModel({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.shortDesc,
    required this.description,
    required this.features,
    required this.icon,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        titleEn,
        shortDesc,
        description,
        features,
        icon,
        image,
      ];

  /// 從 JSON 建立模型
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as String,
      title: json['title'] as String,
      titleEn: json['titleEn'] as String,
      shortDesc: json['shortDesc'] as String,
      description: json['description'] as String,
      features: List<String>.from(json['features'] as List),
      icon: json['icon'] as String,
      image: json['image'] as String,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'titleEn': titleEn,
      'shortDesc': shortDesc,
      'description': description,
      'features': features,
      'icon': icon,
      'image': image,
    };
  }
}
