/// ============================================================================
/// 檔案名稱：faq_model.dart
/// 檔案描述：常見問題資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義常見問題的資料模型，包含問題、答案、分類等資訊。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 常見問題資料模型
///
/// 包含 FAQ 問答的完整資訊，用於常見問題頁面展示。
class FaqModel extends Equatable {
  /// 問題 ID
  final int id;

  /// 問題內容
  final String question;

  /// 答案內容
  final String answer;

  /// 分類
  final String category;

  /// 建構函式
  const FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
        category,
      ];

  /// 從 JSON 建立模型
  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
      category: json['category'] as String,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
    };
  }
}
