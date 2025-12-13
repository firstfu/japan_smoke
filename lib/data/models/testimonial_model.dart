/// ============================================================================
/// 檔案名稱：testimonial_model.dart
/// 檔案描述：客戶評價資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義客戶評價的資料模型，包含客戶姓名、評價內容、評分等資訊。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 客戶評價資料模型
///
/// 包含客戶評價的完整資訊，用於客戶好評區塊展示。
class TestimonialModel extends Equatable {
  /// 評價 ID
  final int id;

  /// 客戶姓名
  final String name;

  /// 客戶身份
  final String title;

  /// 所在地區
  final String location;

  /// 評價內容
  final String content;

  /// 評分（1-5）
  final int rating;

  /// 使用的服務
  final String service;

  /// 客戶頭像路徑（選填）
  final String? image;

  /// 建構函式
  const TestimonialModel({
    required this.id,
    required this.name,
    required this.title,
    required this.location,
    required this.content,
    required this.rating,
    required this.service,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        location,
        content,
        rating,
        service,
        image,
      ];

  /// 從 JSON 建立模型
  factory TestimonialModel.fromJson(Map<String, dynamic> json) {
    return TestimonialModel(
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      content: json['content'] as String,
      rating: json['rating'] as int,
      service: json['service'] as String,
      image: json['image'] as String?,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'location': location,
      'content': content,
      'rating': rating,
      'service': service,
      'image': image,
    };
  }
}
