/// ============================================================================
/// 檔案名稱：team_member_model.dart
/// 檔案描述：團隊成員資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義團隊成員的資料模型，包含成員姓名、職位、描述等資訊。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 團隊成員資料模型
///
/// 包含團隊成員的基本資訊，用於關於我們頁面的團隊區塊展示。
class TeamMemberModel extends Equatable {
  /// 成員 ID
  final int id;

  /// 成員姓名
  final String name;

  /// 職位
  final String role;

  /// 描述
  final String description;

  /// 頭像路徑（選填）
  final String? image;

  /// 建構函式
  const TeamMemberModel({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        role,
        description,
        image,
      ];

  /// 從 JSON 建立模型
  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      id: json['id'] as int,
      name: json['name'] as String,
      role: json['role'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'description': description,
      'image': image,
    };
  }
}
