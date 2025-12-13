/// ============================================================================
/// 檔案名稱：contact_form_model.dart
/// 檔案描述：聯絡表單資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義聯絡/預約表單的資料模型，包含姓名、電話、服務項目等欄位。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 聯絡表單資料模型
///
/// 包含預約表單的所有欄位資訊，用於表單狀態管理和提交。
class ContactFormModel extends Equatable {
  /// 客戶姓名
  final String name;

  /// 客戶電話
  final String phone;

  /// 客戶電子郵件（選填）
  final String? email;

  /// 選擇的服務項目
  final String? service;

  /// 需求說明（選填）
  final String? message;

  /// 建構函式
  const ContactFormModel({
    required this.name,
    required this.phone,
    this.email,
    this.service,
    this.message,
  });

  /// 空表單
  factory ContactFormModel.empty() {
    return const ContactFormModel(
      name: '',
      phone: '',
      email: null,
      service: null,
      message: null,
    );
  }

  @override
  List<Object?> get props => [
        name,
        phone,
        email,
        service,
        message,
      ];

  /// 複製並修改
  ContactFormModel copyWith({
    String? name,
    String? phone,
    String? email,
    String? service,
    String? message,
  }) {
    return ContactFormModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      service: service ?? this.service,
      message: message ?? this.message,
    );
  }

  /// 從 JSON 建立模型
  factory ContactFormModel.fromJson(Map<String, dynamic> json) {
    return ContactFormModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      service: json['service'] as String?,
      message: json['message'] as String?,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'service': service,
      'message': message,
    };
  }

  /// 驗證表單是否有效
  bool get isValid {
    return name.isNotEmpty && phone.isNotEmpty && service != null;
  }
}
