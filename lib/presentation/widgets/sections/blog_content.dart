/// ============================================================================
/// 檔案名稱：blog_content.dart
/// 檔案描述：博客文章內容組件
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義博客文章內容的渲染組件，支援 Markdown 格式。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';

/// 博客文章內容組件
///
/// 用於渲染博客文章的 Markdown 內容。
class BlogContent extends StatelessWidget {
  /// Markdown 內容
  final String content;

  /// 是否可選擇文字
  final bool selectable;

  const BlogContent({
    super.key,
    required this.content,
    this.selectable = true,
  });

  @override
  Widget build(BuildContext context) {
    final markdownStyleSheet = MarkdownStyleSheet(
      h1: Theme.of(context).textTheme.headlineMedium,
      h2: Theme.of(context).textTheme.headlineSmall,
      h3: Theme.of(context).textTheme.titleLarge,
      h4: Theme.of(context).textTheme.titleMedium,
      h5: Theme.of(context).textTheme.titleSmall,
      h6: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      p: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.8,
          ),
      blockquote: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontStyle: FontStyle.italic,
            color: AppColors.textSecondary,
          ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppColors.primary,
            width: 4,
          ),
        ),
        color: AppColors.secondary,
      ),
      blockquotePadding: const EdgeInsets.all(16),
      code: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: 'monospace',
            backgroundColor: AppColors.secondary,
          ),
      codeblockDecoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      codeblockPadding: const EdgeInsets.all(16),
      listBullet: Theme.of(context).textTheme.bodyLarge,
      tableHead: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      tableBody: Theme.of(context).textTheme.bodyMedium,
      tableBorder: TableBorder.all(
        color: AppColors.border,
        width: 1,
      ),
      tableHeadAlign: TextAlign.center,
      tableCellsPadding: const EdgeInsets.all(8),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      a: const TextStyle(
        color: AppColors.primary,
        decoration: TextDecoration.underline,
      ),
    );

    if (selectable) {
      return MarkdownBody(
        data: content,
        styleSheet: markdownStyleSheet,
        selectable: true,
        onTapLink: (text, href, title) => _launchUrl(href),
      );
    }

    return MarkdownBody(
      data: content,
      styleSheet: markdownStyleSheet,
      onTapLink: (text, href, title) => _launchUrl(href),
    );
  }

  Future<void> _launchUrl(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

/// 文章標頭組件
class ArticleHeader extends StatelessWidget {
  /// 標題
  final String title;

  /// 作者
  final String author;

  /// 發布日期
  final String publishedAt;

  /// 閱讀時間
  final int readTime;

  /// 分類
  final String category;

  const ArticleHeader({
    super.key,
    required this.title,
    required this.author,
    required this.publishedAt,
    required this.readTime,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 分類標籤
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            category,
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
          title,
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
                author[0],
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
                  author,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  publishedAt,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
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
                  '$readTime 分鐘',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textMuted,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
