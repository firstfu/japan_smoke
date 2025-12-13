# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 專案概述

這是一個名為 `japan_smoke` 的 Flutter 專案，支援 iOS、Android、Windows 等多平台。目前為初始模板狀態。

## 常用開發指令

```bash
# 取得依賴套件
flutter pub get

# 執行應用程式（開發模式）
flutter run

# 執行靜態分析
flutter analyze

# 執行所有測試
flutter test

# 執行單一測試檔案
flutter test test/widget_test.dart

# 建置發行版本
flutter build apk          # Android
flutter build ios          # iOS
flutter build windows      # Windows

# 熱重載（開發時按 r）
# 熱重啟（開發時按 R）
```

## 專案結構

- `lib/` - 主要 Dart 程式碼
- `test/` - 測試檔案
- `ios/` - iOS 平台專用設定
- `android/` - Android 平台專用設定（使用 Kotlin DSL）
- `windows/` - Windows 平台專用設定

## 技術規格

- Dart SDK: ^3.10.3
- 使用 `flutter_lints` 進行程式碼規範檢查
- 分析設定位於 `analysis_options.yaml`
