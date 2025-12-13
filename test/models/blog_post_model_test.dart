/// ============================================================================
/// 檔案名稱：blog_post_model_test.dart
/// 檔案描述：博客文章模型單元測試
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案包含 BlogPostModel 的單元測試。
/// ============================================================================

import 'package:flutter_test/flutter_test.dart';
import 'package:japan_smoke/data/models/blog_post_model.dart';

void main() {
  group('BlogPostModel', () {
    const testPost = BlogPostModel(
      id: 1,
      title: '測試文章標題',
      slug: 'test-article',
      excerpt: '這是測試文章的摘要',
      content: '這是測試文章的完整內容',
      author: '測試作者',
      category: '測試分類',
      image: '/images/test.jpg',
      readTime: 5,
      publishedAt: '2025-01-13',
    );

    test('should create BlogPostModel with all required fields', () {
      expect(testPost.id, 1);
      expect(testPost.title, '測試文章標題');
      expect(testPost.slug, 'test-article');
      expect(testPost.excerpt, '這是測試文章的摘要');
      expect(testPost.author, '測試作者');
      expect(testPost.category, '測試分類');
      expect(testPost.readTime, 5);
      expect(testPost.publishedAt, '2025-01-13');
    });

    test('should convert to JSON correctly', () {
      final json = testPost.toJson();

      expect(json['id'], 1);
      expect(json['title'], '測試文章標題');
      expect(json['slug'], 'test-article');
      expect(json['excerpt'], '這是測試文章的摘要');
      expect(json['content'], '這是測試文章的完整內容');
      expect(json['author'], '測試作者');
      expect(json['category'], '測試分類');
      expect(json['image'], '/images/test.jpg');
      expect(json['readTime'], 5);
      expect(json['publishedAt'], '2025-01-13');
    });

    test('should create from JSON correctly', () {
      final json = {
        'id': 2,
        'title': 'JSON 文章',
        'slug': 'json-article',
        'excerpt': 'JSON 摘要',
        'content': 'JSON 內容',
        'author': 'JSON 作者',
        'category': 'JSON 分類',
        'image': '/images/json.jpg',
        'readTime': 10,
        'publishedAt': '2025-01-14',
      };

      final post = BlogPostModel.fromJson(json);

      expect(post.id, 2);
      expect(post.title, 'JSON 文章');
      expect(post.slug, 'json-article');
      expect(post.readTime, 10);
    });

    test('should support equality comparison', () {
      const post1 = BlogPostModel(
        id: 1,
        title: '文章',
        slug: 'article',
        excerpt: '摘要',
        content: '內容',
        author: '作者',
        category: '分類',
        image: '/image.jpg',
        readTime: 5,
        publishedAt: '2025-01-13',
      );

      const post2 = BlogPostModel(
        id: 1,
        title: '文章',
        slug: 'article',
        excerpt: '摘要',
        content: '內容',
        author: '作者',
        category: '分類',
        image: '/image.jpg',
        readTime: 5,
        publishedAt: '2025-01-13',
      );

      expect(post1, equals(post2));
    });
  });
}
