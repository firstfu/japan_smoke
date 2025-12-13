<!--
================================================================================
檔案名稱：todo.md
檔案描述：Japan Smoke Flutter App 開發任務清單
建立日期：2025-01-13
作者：Claude Code

本文件記錄專案的所有開發任務，分階段組織。
完成的任務請使用 [x] 標記，未完成使用 [ ] 標記。

使用說明：
- 每完成一個功能後，請將對應的 [ ] 改為 [x]
- 任務按優先級排列，請依序完成
================================================================================
-->

# Japan Smoke Flutter App 開發任務清單

## Phase 1：基礎建設

### 文檔與配置
- [x] 建立 docs/prd.md 產品規劃書
- [x] 建立 docs/todo.md 任務清單
- [x] 更新 CLAUDE.md 文件
- [x] 配置 pubspec.yaml 依賴套件

### 專案結構
- [x] 建立 lib/core/ 目錄結構
- [x] 建立 lib/data/ 目錄結構
- [x] 建立 lib/presentation/ 目錄結構
- [x] 建立 assets/images/ 資源目錄

### 設計系統
- [x] 實現 app_colors.dart 顏色常量
- [x] 實現 app_strings.dart 字串常量
- [x] 實現 app_theme.dart 主題配置
- [x] 配置 Google Fonts（Noto Sans TC / Noto Serif TC）

### 路由配置
- [x] 建立 route_names.dart 路由名稱常量
- [x] 實現 app_router.dart GoRouter 配置

### 資料模型
- [x] 實現 company_model.dart 公司資訊模型
- [x] 實現 service_model.dart 服務項目模型
- [x] 實現 testimonial_model.dart 客戶評價模型
- [x] 實現 team_member_model.dart 團隊成員模型
- [x] 實現 faq_model.dart 常見問題模型
- [x] 實現 blog_post_model.dart 博客文章模型
- [x] 實現 portfolio_item_model.dart 作品案例模型
- [x] 實現 contact_form_model.dart 聯絡表單模型

### 靜態資料
- [x] 建立 app_data.dart 靜態資料來源
- [x] 轉換公司資訊資料
- [x] 轉換服務項目資料（4 項）
- [x] 轉換客戶評價資料（4 項）
- [x] 轉換團隊成員資料（3 項）
- [x] 轉換常見問題資料（5 項）
- [x] 轉換博客文章資料（8 項）
- [x] 轉換作品案例資料（3 項）

---

## Phase 2：核心頁面

### 共用組件
- [x] 實現 app_scaffold.dart 頁面框架
- [x] 實現 app_drawer.dart 側邊抽屜導航（內嵌於 app_scaffold.dart）
- [x] 實現 app_bottom_nav.dart 底部導航列（內嵌於 app_scaffold.dart）
- [x] 實現 primary_button.dart 主要按鈕
- [x] 實現 secondary_button.dart 次要按鈕
- [x] 實現 section_header.dart 區塊標題
- [x] 實現 loading_widget.dart 載入狀態

### 應用入口
- [x] 更新 main.dart 應用入口
- [x] 建立 app.dart MaterialApp 配置

### 首頁（Home）
- [x] 實現 home_page.dart 首頁主體
- [x] 實現 hero_section.dart Hero 區塊（內嵌於 home_page.dart）
- [x] 實現 services_overview_section.dart 服務概覽（內嵌於 home_page.dart）
- [x] 實現 portfolio_preview_section.dart 案例預覽（內嵌於 home_page.dart）
- [x] 實現 testimonials_section.dart 客戶評價（內嵌於 home_page.dart）
- [x] 實現 cta_section.dart 行動召喚區塊（內嵌於 home_page.dart）

### 服務頁面（Services）
- [x] 實現 services_page.dart 服務列表頁
- [x] 實現 service_detail_page.dart 服務詳情頁
- [x] 實現 service_card.dart 服務卡片組件

### 關於我們頁面（About）
- [x] 實現 about_page.dart 關於頁面
- [x] 實現 team_section.dart 團隊區塊（內嵌於 about_page.dart）
- [x] 實現 team_member_card.dart 團隊成員卡片（內嵌於 about_page.dart）

### 聯絡頁面（Contact）
- [x] 實現 contact_page.dart 聯絡頁面
- [x] 實現 contact_form.dart 預約表單（內嵌於 contact_page.dart）
- [x] 實現 contact_info_card.dart 聯絡資訊卡片（內嵌於 contact_page.dart）

---

## Phase 3：功能頁面

### 作品案例頁面（Portfolio）
- [x] 實現 portfolio_page.dart 案例列表頁
- [x] 實現 portfolio_detail_page.dart 案例詳情頁
- [x] 實現 portfolio_card.dart 案例卡片組件
- [x] 實現 before_after_slider.dart 前後對比滑塊

### 博客頁面（Blog）
- [x] 實現 blog_page.dart 文章列表頁
- [x] 實現 blog_detail_page.dart 文章詳情頁
- [x] 實現 blog_card.dart 文章卡片組件
- [x] 實現 blog_content.dart 文章內容組件

### FAQ 頁面
- [x] 實現 faq_page.dart FAQ 頁面
- [x] 實現 faq_accordion.dart 手風琴組件（內嵌於 faq_page.dart）

---

## Phase 4：完善優化

### 響應式設計
- [x] 實現 responsive_utils.dart 響應式工具
- [x] 適配手機螢幕
- [x] 適配平板螢幕
- [x] 優化橫向模式

### 動畫效果
- [x] 實現 animation_utils.dart 動畫工具
- [x] 頁面切換動畫
- [x] 組件進入動畫
- [x] 按鈕互動效果

### 效能優化
- [x] 實現 performance_utils.dart 效能工具
- [x] 圖片懶加載
- [x] 列表優化
- [x] 記憶體優化

### 測試
- [x] 單元測試（Models）
- [x] Widget 測試（關鍵組件）
- [x] 整合測試（完整流程）

---

## 完成統計

- **Phase 1**：28 / 28 項 ✅
- **Phase 2**：25 / 25 項 ✅
- **Phase 3**：11 / 11 項 ✅
- **Phase 4**：12 / 12 項 ✅
- **總計**：76 / 76 項 ✅

---

## 專案完成！🎉

所有功能已完成開發，專案可以正常運行。

### 執行方式
```bash
flutter run          # 執行應用
flutter build apk    # 建置 Android APK
flutter build ios    # 建置 iOS
flutter test         # 執行測試
```
