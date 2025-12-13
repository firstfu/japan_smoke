/// ============================================================================
/// 檔案名稱：blog_post_model.dart
/// 檔案描述：博客文章資料模型
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義博客文章的資料模型，包含標題、內容、作者、發布日期等資訊。
/// ============================================================================

import 'package:equatable/equatable.dart';

/// 博客文章資料模型
///
/// 包含博客文章的完整資訊，用於博客列表和詳情頁面展示。
class BlogPostModel extends Equatable {
  /// 文章 ID
  final int id;

  /// 文章 slug（URL 友善識別碼）
  final String slug;

  /// 文章標題
  final String title;

  /// 文章摘要
  final String excerpt;

  /// 文章完整內容
  final String content;

  /// 文章縮圖路徑
  final String image;

  /// 文章分類
  final String category;

  /// 作者姓名
  final String author;

  /// 發布日期
  final String publishedAt;

  /// 閱讀時間（分鐘）
  final int readTime;

  /// 建構函式
  const BlogPostModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.image,
    required this.category,
    required this.author,
    required this.publishedAt,
    required this.readTime,
  });

  @override
  List<Object?> get props => [
        id,
        slug,
        title,
        excerpt,
        content,
        image,
        category,
        author,
        publishedAt,
        readTime,
      ];

  /// 從 JSON 建立模型
  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      title: json['title'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
      author: json['author'] as String,
      publishedAt: json['publishedAt'] as String,
      readTime: json['readTime'] as int,
    );
  }

  /// 轉換為 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': slug,
      'title': title,
      'excerpt': excerpt,
      'content': content,
      'image': image,
      'category': category,
      'author': author,
      'publishedAt': publishedAt,
      'readTime': readTime,
    };
  }
}
