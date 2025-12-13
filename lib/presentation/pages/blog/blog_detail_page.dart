/// ============================================================================
/// 檔案名稱：blog_detail_page.dart
/// 檔案描述：博客文章詳情頁面
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義博客文章詳情頁面，展示文章完整內容。
/// ============================================================================

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/datasources/local/app_data.dart';

/// 博客文章詳情頁面
class BlogDetailPage extends StatelessWidget {
  final String postId;

  const BlogDetailPage({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    final post = AppData.getBlogPostBySlug(postId);

    if (post == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('文章詳情')),
        body: const Center(child: Text('找不到此文章')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('文章詳情'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 圖片區域（佔位）
            Container(
              width: double.infinity,
              height: 200,
              color: AppColors.secondary,
              child: Center(
                child: Icon(
                  Icons.article,
                  size: 64,
                  color: AppColors.textMuted,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 分類標籤
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      post.category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.accent,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 標題
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),

                  // 元資訊
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primary,
                        child: Text(
                          post.author[0],
                          style: const TextStyle(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.author,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            post.publishedAt,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${post.readTime} ${AppStrings.minutes}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // 摘要
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(
                          color: AppColors.primary,
                          width: 4,
                        ),
                      ),
                    ),
                    child: Text(
                      post.excerpt,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontStyle: FontStyle.italic,
                            height: 1.6,
                          ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 內容（目前顯示佔位文字）
                  Text(
                    '文章內容將在後續版本中加入...\n\n'
                    '本文將詳細介紹 ${post.title} 的相關知識和實用技巧。',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.8,
                        ),
                  ),

                  const SizedBox(height: 32),

                  // CTA 區塊
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '需要專業服務嗎？',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppColors.textLight),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '立即聯絡我們，獲得免費評估！',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.textLight),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () {
                            // TODO: 導航到聯絡頁面
                          },
                          icon: const Icon(Icons.phone),
                          label: const Text(AppStrings.btnCallNow),
                        ),
                      ],
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
