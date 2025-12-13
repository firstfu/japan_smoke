# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 專案概述

這是一個名為 `japan_smoke` 的 Flutter 專案，是「塗新居」（TuXinJu）品牌的行動應用程式版本。提供南投縣地區的屋頂清洗、油漆、防水服務展示與預約功能。

**主要功能：**
- 服務展示（4 大核心服務）
- 作品案例（Before/After 對比）
- 博客系統（8 篇技術文章）
- 線上預約表單
- FAQ 常見問題
- 公司與團隊介紹

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

```
japan_smoke/
├── lib/                          # 主要 Dart 程式碼
│   ├── main.dart                 # 應用入口
│   ├── app.dart                  # MaterialApp 配置
│   ├── core/                     # 核心層
│   │   ├── constants/            # 常量定義
│   │   ├── theme/                # 主題配置
│   │   └── router/               # 路由配置
│   ├── data/                     # 資料層
│   │   ├── models/               # 資料模型
│   │   └── datasources/          # 資料來源
│   └── presentation/             # UI 層
│       ├── providers/            # Riverpod Providers
│       ├── pages/                # 頁面
│       └── widgets/              # 共用組件
├── test/                         # 測試檔案
├── docs/                         # 專案文檔
│   ├── prd.md                    # 產品規劃書
│   └── todo.md                   # 開發任務清單
├── assets/                       # 靜態資源
│   └── images/                   # 圖片資源
├── ios/                          # iOS 平台設定
├── android/                      # Android 平台設定
└── windows/                      # Windows 平台設定
```

## 技術規格

- **Flutter**: 3.x
- **Dart SDK**: ^3.10.3
- **狀態管理**: Riverpod
- **路由**: GoRouter
- **UI 框架**: Material 3

## 開發規範

### 1. 程式碼規範
- 使用 `flutter_lints` 進行程式碼規範檢查
- 分析設定位於 `analysis_options.yaml`
- 所有程式碼使用繁體中文註解

### 2. 文件註解要求
每個 Dart 檔案頂部必須包含詳細註解，格式如下：

```dart
/// ============================================================================
/// 檔案名稱：example.dart
/// 檔案描述：[檔案功能描述]
/// 建立日期：YYYY-MM-DD
/// 作者：Claude Code
/// ============================================================================
```

### 3. 任務追蹤

**重要：每完成一個功能，必須更新 `docs/todo.md`**

1. 開啟 `docs/todo.md` 文件
2. 找到對應的任務項目
3. 將 `[ ]` 改為 `[x]` 表示完成
4. 更新底部的完成統計數字

範例：
```markdown
# 修改前
- [ ] 實現 app_colors.dart 顏色常量

# 修改後
- [x] 實現 app_colors.dart 顏色常量
```

## 相關文檔

- **產品規劃書**：`docs/prd.md`
- **開發任務清單**：`docs/todo.md`
- **參考專案**：`/Users/firstfu/Desktop/paint`（塗新居 Next.js 網站）

## 設計系統

### 色彩
| 名稱 | 色碼 | 用途 |
|-----|------|-----|
| Primary | #1A1B4B | 主色（深藍） |
| Secondary | #E8E6F0 | 次色（淺紫） |
| Accent | #F5C842 | 強調色（金黃） |

### 字體
- 標題：Noto Serif TC
- 內文：Noto Sans TC
