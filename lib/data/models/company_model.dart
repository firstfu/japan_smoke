/// ============================================================================
/// 檔案名稱：company_model.dart
/// 檔案描述：公司資訊資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義公司資訊的資料模型，包含公司名稱、聯絡資訊、服務地區等。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 公司資訊資料模型
///
/// 包含塗新居公司的基本資訊，如名稱、聯絡方式、營業時間、服務地區等。
class CompanyModel extends Equatable {
  /// 公司名稱
  final String name;

  /// 公司英文名稱
  final String nameEn;

  /// 公司標語
  final String slogan;

  /// 公司描述
  final String description;

  /// 電話號碼
  final String phone;

  /// 行動電話
  final String mobile;

  /// 營業時間
  final String hours;

  /// 服務地區
  final String region;

  /// 服務子地區列表
  final List<String> subRegions;

  /// 客戶滿意度（百分比）
  final int satisfactionRate;

  /// 建構函式
  const CompanyModel({
    required this.name,
    required this.nameEn,
    required this.slogan,
    required this.description,
    required this.phone,
    required this.mobile,
    required this.hours,
    required this.region,
    required this.subRegions,
    required this.satisfactionRate,
  });

  @override
  List<Object?> get props => [
        name,
        nameEn,
        slogan,
        description,
        phone,
        mobile,
        hours,
        region,
        subRegions,
        satisfactionRate,
      ];

  /// 從 JSON 建立模型
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] as String,
      nameEn: json['nameEn'] as String,
      slogan: json['slogan'] as String,
      description: json['description'] as String,
      phone: json['phone'] as String,
      mobile: json['mobile'] as String,
      hours: json['hours'] as String,
      region: json['region'] as String,
      subRegions: List<String>.from(json['subRegions'] as List),
      satisfactionRate: json['satisfactionRate'] as int,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameEn': nameEn,
      'slogan': slogan,
      'description': description,
      'phone': phone,
      'mobile': mobile,
      'hours': hours,
      'region': region,
      'subRegions': subRegions,
      'satisfactionRate': satisfactionRate,
    };
  }
}
