/// ============================================================================
/// 檔案名稱：app_strings.dart
/// 檔案描述：Japan Smoke App 字串常量定義
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義應用程式使用的所有字串常量（繁體中文）。
/// 集中管理文字內容，便於維護和國際化擴展。
/// ============================================================================

/// 應用程式字串常量
abstract class AppStrings {
  // ============================================================================
  // 應用程式資訊
  // ============================================================================

  /// 應用程式名稱
  static const String appName = '塗新居';

  /// 應用程式英文名稱
  static const String appNameEn = 'TuXinJu';

  /// 應用程式標語
  static const String appSlogan = '讓您的房屋煥然一新';

  /// 應用程式描述
  static const String appDescription = '南投縣專業屋頂清洗、油漆、防水服務團隊，品質保證。';

  // ============================================================================
  // 導航標籤
  // ============================================================================

  static const String navHome = '首頁';
  static const String navServices = '服務項目';
  static const String navPortfolio = '案例展示';
  static const String navBlog = '知識專欄';
  static const String navAbout = '關於我們';
  static const String navFaq = '常見問題';
  static const String navContact = '聯絡我們';

  // ============================================================================
  // 公司資訊
  // ============================================================================

  static const String companyPhone = '0908-103-398';
  static const String companyHours = '週一至週六 8:00-17:00';
  static const String companyRegion = '南投縣';

  // ============================================================================
  // 按鈕文字
  // ============================================================================

  static const String btnReadMore = '了解更多';
  static const String btnViewAll = '查看全部';
  static const String btnBookNow = '立即預約';
  static const String btnFreeQuote = '免費報價';
  static const String btnCallNow = '立即來電';
  static const String btnSubmit = '送出';
  static const String btnCancel = '取消';
  static const String btnConfirm = '確認';
  static const String btnBack = '返回';

  // ============================================================================
  // 區塊標題
  // ============================================================================

  static const String sectionServices = '我們的服務';
  static const String sectionPortfolio = '案例展示';
  static const String sectionTestimonials = '客戶好評';
  static const String sectionBlog = '知識專欄';
  static const String sectionFaq = '常見問題';
  static const String sectionTeam = '專業團隊';
  static const String sectionContact = '聯絡我們';

  // ============================================================================
  // Hero 區塊
  // ============================================================================

  static const String heroTitle = '專業屋頂清洗、油漆、防水服務';
  static const String heroSubtitle = '南投縣在地服務團隊，品質保證';
  static const String heroCta = '免費諮詢';

  // ============================================================================
  // 表單標籤
  // ============================================================================

  static const String formName = '姓名';
  static const String formPhone = '電話';
  static const String formEmail = '電子郵件';
  static const String formService = '服務項目';
  static const String formMessage = '需求說明';
  static const String formNameHint = '請輸入您的姓名';
  static const String formPhoneHint = '請輸入您的電話';
  static const String formEmailHint = '請輸入您的電子郵件';
  static const String formServiceHint = '請選擇服務項目';
  static const String formMessageHint = '請描述您的需求...';

  // ============================================================================
  // 表單驗證訊息
  // ============================================================================

  static const String validationRequired = '此欄位為必填';
  static const String validationPhone = '請輸入有效的電話號碼';
  static const String validationEmail = '請輸入有效的電子郵件';

  // ============================================================================
  // 狀態訊息
  // ============================================================================

  static const String loading = '載入中...';
  static const String error = '發生錯誤';
  static const String success = '成功';
  static const String noData = '目前沒有資料';
  static const String retry = '重試';

  static const String submitSuccess = '表單已成功送出，我們會盡快與您聯絡！';
  static const String submitError = '送出失敗，請稍後再試。';

  // ============================================================================
  // 案例展示
  // ============================================================================

  static const String beforeLabel = '施工前';
  static const String afterLabel = '施工後';

  // ============================================================================
  // 博客
  // ============================================================================

  static const String readTime = '閱讀時間';
  static const String minutes = '分鐘';
  static const String author = '作者';
  static const String publishedAt = '發布日期';

  // ============================================================================
  // 關於我們
  // ============================================================================

  static const String aboutTitle = '關於塗新居';
  static const String aboutDescription = '''
塗新居是南投縣專業的房屋維護服務團隊，提供屋頂清洗、油漆、防水等全方位服務。

我們的團隊擁有多年豐富經驗，以專業技術和負責任的態度，為每一位客戶提供最優質的服務。從免費評估到施工完成，我們全程用心，確保每個細節都做到最好。

選擇塗新居，就是選擇品質保證。
''';

  // ============================================================================
  // 滿意度
  // ============================================================================

  static const String satisfactionRate = '客戶滿意度';
  static const String yearsExperience = '年服務經驗';
  static const String completedProjects = '完成案件';
}
