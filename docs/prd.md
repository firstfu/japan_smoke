<!--
================================================================================
檔案名稱：prd.md
檔案描述：Japan Smoke Flutter App 產品規劃書（Product Requirements Document）
建立日期：2025-01-13
作者：Claude Code

本文件定義了 Japan Smoke Flutter App 的完整產品需求規格，包含：
- 專案概述與目標
- 目標用戶分析
- 功能需求規格
- 技術架構設計
- 非功能需求

參考來源：Paint 專案（塗新居 Next.js 網站）
================================================================================
-->

# Japan Smoke Flutter App 產品規劃書

## 1. 專案概述

### 1.1 專案背景

本專案旨在將「塗新居」（TuXinJu）品牌的 Next.js 網站轉換為 Flutter 行動應用程式，為南投縣地區的屋頂清洗、油漆、防水服務提供更便捷的行動端體驗。

### 1.2 專案目標

- 建立一個功能完整的 Flutter App，涵蓋服務展示、案例對比、博客內容、線上預約等核心功能
- 提供優質的用戶體驗，採用現代化的 UI 設計
- 支援 iOS 和 Android 雙平台

### 1.3 專案範圍

**包含功能：**
- 首頁（Hero、服務預覽、案例預覽、客戶評價、CTA）
- 服務展示（4 大核心服務）
- 作品案例（Before/After 對比滑塊）
- 博客系統（8 篇技術文章）
- 常見問題（FAQ 手風琴式問答）
- 關於我們（公司介紹、團隊成員）
- 聯絡我們（預約表單、聯絡資訊）

**不包含功能：**
- 用戶註冊/登入系統
- 線上支付功能
- 即時聊天功能
- 後台管理系統

---

## 2. 目標用戶

### 2.1 用戶畫像

**主要用戶群：**
- 年齡：35-65 歲
- 地區：南投縣及周邊地區（南投市、草屯鎮、埔里鎮、竹山鎮等 13 個鄉鎮）
- 身份：住宅屋主、店家老闆、農舍屋主、公寓住戶
- 需求：屋頂清洗、油漆粉刷、防水處理等房屋維護服務

### 2.2 使用場景

1. **了解服務**：用戶想了解塗新居提供的服務項目和專業能力
2. **查看案例**：用戶想看實際施工前後的對比效果
3. **獲取知識**：用戶想學習屋頂保養、防水等專業知識
4. **預約服務**：用戶想預約免費評估或諮詢服務
5. **聯絡公司**：用戶想撥打電話或取得聯絡資訊

---

## 3. 功能需求規格

### 3.1 首頁（Home）

| 功能區塊 | 描述 | 優先級 |
|---------|------|-------|
| Hero 區塊 | 主視覺展示，包含公司 Slogan、CTA 按鈕 | P0 |
| 服務概覽 | 展示 4 大核心服務的卡片 | P0 |
| 案例預覽 | 展示精選作品案例（可滑動） | P1 |
| 客戶評價 | 展示客戶好評（輪播形式） | P1 |
| CTA 區塊 | 行動召喚，引導用戶預約服務 | P0 |
| 公司統計 | 展示滿意度、服務次數等數據 | P2 |

### 3.2 服務頁面（Services）

**服務列表頁：**
- 以卡片形式展示 4 大服務
- 每張卡片包含：圖示、標題、簡介、「了解更多」按鈕

**服務詳情頁：**
- 服務完整介紹
- 服務特色列表
- 相關案例展示
- 預約服務 CTA

**四大核心服務：**

| 服務 ID | 服務名稱 | 英文名稱 |
|--------|---------|---------|
| roof-cleaning | 洗屋頂 | Roof Cleaning |
| roof-painting | 油漆屋頂 | Roof Painting |
| interior-painting | 室內油漆 | Interior Painting |
| waterproofing | 防水處理 | Waterproofing |

### 3.3 作品案例頁面（Portfolio）

**案例列表頁：**
- 卡片式展示所有案例
- 支援按服務類型篩選

**案例詳情頁：**
- **Before/After 滑塊**：可拖動的前後對比滑塊
- 案例描述
- 施工地點
- 完工日期

### 3.4 博客頁面（Blog）

**文章列表頁：**
- 卡片式展示 8 篇文章
- 顯示標題、摘要、分類、發布日期、閱讀時間

**文章詳情頁：**
- 完整文章內容（Markdown 渲染）
- 作者資訊
- 相關文章推薦

**文章分類：**
- 屋頂清洗
- 屋頂油漆
- 室內油漆
- 防水工程
- 外牆清洗

### 3.5 常見問題頁面（FAQ）

- 手風琴式展開/收合
- 一次只展開一個問題
- 按分類組織問題

### 3.6 關於我們頁面（About）

- 公司介紹
- 服務理念
- 團隊成員展示（3 人）
- 服務地區

### 3.7 聯絡我們頁面（Contact）

**聯絡資訊：**
- 電話號碼（可點擊撥打）
- 營業時間
- 服務地區

**預約表單：**
| 欄位 | 類型 | 必填 |
|-----|------|-----|
| 姓名 | 文字輸入 | 是 |
| 電話 | 電話輸入 | 是 |
| Email | 郵件輸入 | 否 |
| 服務項目 | 下拉選單 | 是 |
| 需求說明 | 多行文字 | 否 |

---

## 4. 技術架構設計

### 4.1 技術棧

| 類別 | 技術選型 | 說明 |
|-----|---------|-----|
| 框架 | Flutter 3.x | 跨平台行動應用開發 |
| 語言 | Dart 3.10+ | Flutter 官方語言 |
| 狀態管理 | Riverpod | 編譯時安全、易於測試 |
| 路由 | GoRouter | 聲明式路由管理 |
| UI 組件 | Material 3 | Google Material Design |

### 4.2 專案結構

```
lib/
├── main.dart                 # 應用入口
├── app.dart                  # MaterialApp 配置
├── core/                     # 核心層
│   ├── constants/            # 常量定義
│   ├── theme/                # 主題配置
│   └── router/               # 路由配置
├── data/                     # 資料層
│   ├── models/               # 資料模型
│   └── datasources/          # 資料來源
└── presentation/             # UI 層
    ├── providers/            # Riverpod Providers
    ├── pages/                # 頁面
    └── widgets/              # 共用組件
```

### 4.3 設計系統

**色彩系統：**
| 名稱 | 色碼 | 用途 |
|-----|------|-----|
| Primary | #1A1B4B | 主色（深藍） |
| Secondary | #E8E6F0 | 次色（淺紫） |
| Accent | #F5C842 | 強調色（金黃） |
| Success | #4CAF50 | 成功狀態 |
| Error | #E53935 | 錯誤狀態 |
| Warning | #FF9800 | 警告狀態 |
| Info | #2196F3 | 資訊提示 |

**字體系統：**
- 標題：Noto Serif TC
- 內文：Noto Sans TC

### 4.4 頁面路由

| 路由路徑 | 頁面名稱 |
|---------|---------|
| `/` | 首頁 |
| `/services` | 服務列表 |
| `/services/:id` | 服務詳情 |
| `/portfolio` | 作品案例列表 |
| `/portfolio/:id` | 案例詳情 |
| `/blog` | 博客列表 |
| `/blog/:id` | 文章詳情 |
| `/about` | 關於我們 |
| `/faq` | 常見問題 |
| `/contact` | 聯絡我們 |

---

## 5. 非功能需求

### 5.1 效能需求

- 首頁載入時間 < 2 秒
- 頁面切換流暢（60 fps）
- 圖片懶加載與快取

### 5.2 相容性需求

- iOS 12.0+
- Android 5.0+ (API 21+)

### 5.3 可用性需求

- 支援繁體中文
- 響應式設計（適配不同螢幕尺寸）
- 無障礙支援（基本）

### 5.4 可維護性需求

- 遵循 Flutter 官方程式碼規範
- 每個檔案頂部包含詳細註解
- 模組化架構，易於擴展

---

## 6. 資料規格

### 6.1 公司資訊（Company）

```dart
{
  name: '塗新居',
  nameEn: 'TuXinJu',
  slogan: '讓您的房屋煥然一新',
  phone: '0908-103-398',
  hours: '週一至週六 8:00-17:00',
  region: '南投縣',
  subRegions: ['南投市', '草屯鎮', '埔里鎮', ...],
  satisfactionRate: 98
}
```

### 6.2 服務項目（Services）- 4 項

```dart
{
  id: 'roof-cleaning',
  title: '洗屋頂',
  shortDesc: '專業高壓清洗，還原屋頂原貌',
  description: '...',
  features: ['高壓水柱清洗', '環保清潔劑', ...],
  icon: 'droplets',
  image: 'assets/images/services/roof-cleaning.jpg'
}
```

### 6.3 客戶評價（Testimonials）- 4 項

```dart
{
  id: 1,
  name: '林先生',
  title: '住宅屋主',
  location: '南投市',
  content: '...',
  rating: 5,
  service: '洗屋頂'
}
```

### 6.4 團隊成員（Team）- 3 項

```dart
{
  id: 1,
  name: '陳先生',
  role: '創辦人 / 總監',
  description: '...'
}
```

### 6.5 常見問題（FAQs）- 5 項

```dart
{
  id: 1,
  question: '洗屋頂需要多長時間？',
  answer: '...',
  category: 'roof-cleaning'
}
```

### 6.6 博客文章（Blog Posts）- 8 項

```dart
{
  id: 1,
  slug: 'roof-cleaning-guide',
  title: '屋頂清洗完整指南...',
  excerpt: '...',
  content: '...',
  category: '屋頂清洗',
  author: '陳先生',
  publishedAt: '2025-01-15',
  readTime: 5
}
```

### 6.7 作品案例（Portfolio）- 3 項

```dart
{
  id: 1,
  title: '南投市透天厝屋頂清洗',
  description: '...',
  category: 'roof-cleaning',
  location: '南投市',
  beforeImage: 'assets/images/portfolio/case-1-before.jpg',
  afterImage: 'assets/images/portfolio/case-1-after.jpg',
  completedAt: '2025-01'
}
```

---

## 7. 里程碑

### Phase 1：基礎建設
- 建立專案結構
- 配置依賴套件
- 實現設計系統
- 配置路由
- 定義資料模型

### Phase 2：核心頁面
- 首頁實現
- 服務頁面
- 關於我們頁面
- 聯絡頁面

### Phase 3：功能頁面
- 作品案例頁面（含 Before/After 滑塊）
- 博客頁面
- FAQ 頁面

### Phase 4：完善優化
- 響應式佈局優化
- 動畫效果
- 測試

---

## 8. 附錄

### 8.1 參考資源

- Paint 專案（塗新居 Next.js 網站）：`/Users/firstfu/Desktop/paint`
- Flutter 官方文檔：https://docs.flutter.dev
- Riverpod 文檔：https://riverpod.dev
- GoRouter 文檔：https://pub.dev/packages/go_router

### 8.2 變更記錄

| 日期 | 版本 | 說明 |
|-----|------|-----|
| 2025-01-13 | 1.0 | 初始版本 |
