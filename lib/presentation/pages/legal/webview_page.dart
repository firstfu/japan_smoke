/// ============================================================================
/// 檔案名稱：webview_page.dart
/// 檔案描述：通用 WebView 頁面，用於顯示隱私權政策、使用者條款等外部網頁
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義一個可重用的 WebView 頁面元件，載入指定 URL 的網頁內容。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/constants/app_colors.dart';

/// WebView 頁面
///
/// 用於顯示外部網頁內容，如隱私權政策、使用者條款等。
class WebViewPage extends StatefulWidget {
  /// 頁面標題
  final String title;

  /// 要載入的網頁 URL
  final String url;

  const WebViewPage({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  double _loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  /// 初始化 WebView 控制器
  void _initWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.background)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _loadingProgress = progress / 100;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // WebView 內容
          WebViewWidget(controller: _controller),

          // 載入進度指示器
          if (_isLoading)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: _loadingProgress,
                backgroundColor: AppColors.secondary.withValues(alpha: 0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.accent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
