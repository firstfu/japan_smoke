/// ============================================================================
/// 檔案名稱：app_data.dart
/// 檔案描述：Japan Smoke App 靜態資料來源
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案包含應用程式的所有靜態資料，轉換自 Paint 專案的 constants.ts。
/// 包含公司資訊、服務項目、客戶評價、團隊成員、FAQ、博客文章、作品案例等。
/// ============================================================================

import '../../models/company_model.dart';
import '../../models/service_model.dart';
import '../../models/testimonial_model.dart';
import '../../models/team_member_model.dart';
import '../../models/faq_model.dart';
import '../../models/blog_post_model.dart';
import '../../models/portfolio_item_model.dart';

/// 應用程式靜態資料
///
/// 集中管理所有靜態資料，便於維護和更新。
abstract class AppData {
  // ============================================================================
  // 公司資訊
  // ============================================================================

  /// 公司基本資訊
  static const CompanyModel company = CompanyModel(
    name: '塗新居',
    nameEn: 'TuXinJu',
    slogan: '讓您的房屋煥然一新',
    description: '南投縣專業屋頂清洗、油漆、防水服務團隊，品質保證。',
    phone: '0908-103-398',
    mobile: '0908-103-398',
    hours: '週一至週六 8:00-17:00',
    region: '南投縣',
    subRegions: [
      '南投市',
      '草屯鎮',
      '埔里鎮',
      '竹山鎮',
      '集集鎮',
      '名間鄉',
      '鹿谷鄉',
      '中寮鄉',
      '魚池鄉',
      '國姓鄉',
      '水里鄉',
      '信義鄉',
      '仁愛鄉',
    ],
    satisfactionRate: 98,
  );

  // ============================================================================
  // 服務項目
  // ============================================================================

  /// 服務項目列表（4 項）
  static const List<ServiceModel> services = [
    ServiceModel(
      id: 'roof-cleaning',
      title: '洗屋頂',
      titleEn: 'Roof Cleaning',
      shortDesc: '專業高壓清洗，還原屋頂原貌',
      description:
          '使用專業高壓清洗設備，徹底清除屋頂上的青苔、污垢、鳥糞等頑固髒污，讓您的屋頂恢復亮麗如新。我們採用環保清潔劑，不傷害屋頂材質，同時保護環境。',
      features: ['高壓水柱清洗', '環保清潔劑', '青苔藻類去除', '排水溝清理'],
      icon: 'droplets',
      image: 'assets/images/services/roof-cleaning.jpg',
    ),
    ServiceModel(
      id: 'roof-painting',
      title: '油漆屋頂',
      titleEn: 'Roof Painting',
      shortDesc: '隔熱防鏽，延長屋頂壽命',
      description:
          '採用高品質隔熱防鏽漆料，不僅美化屋頂外觀，更能有效降低室內溫度，延長屋頂使用壽命。我們提供多種顏色選擇，滿足您的個性化需求。',
      features: ['隔熱塗料', '防鏽處理', '多色可選'],
      icon: 'paintbrush',
      image: 'assets/images/services/roof-painting.jpg',
    ),
    ServiceModel(
      id: 'interior-painting',
      title: '室內油漆',
      titleEn: 'Interior Painting',
      shortDesc: '精緻粉刷，打造溫馨空間',
      description:
          '專業室內粉刷服務，從牆面修補到精緻上漆，每一道工序都嚴格把關。使用低 VOC 環保漆料，保護家人健康，讓您的居家空間煥然一新。',
      features: ['牆面修補', '批土打底', '環保漆料', '細節收邊'],
      icon: 'roller',
      image: 'assets/images/services/interior-painting.jpg',
    ),
    ServiceModel(
      id: 'waterproofing',
      title: '防水處理',
      titleEn: 'Waterproofing',
      shortDesc: '徹底防漏，守護您的家',
      description:
          '針對屋頂、外牆、浴室等容易漏水區域，提供專業防水工程服務。使用優質防水材料，搭配精湛工法，從根本解決漏水問題，給您一個乾爽的居住環境。',
      features: ['漏水檢測', '防水層施作', '結構補強'],
      icon: 'shield',
      image: 'assets/images/services/waterproofing.jpg',
    ),
  ];

  // ============================================================================
  // 客戶評價
  // ============================================================================

  /// 客戶評價列表（4 項）
  static const List<TestimonialModel> testimonials = [
    TestimonialModel(
      id: 1,
      name: '林先生',
      title: '住宅屋主',
      location: '南投市',
      content: '屋頂洗完真的像新的一樣！師傅很專業，價格也很合理。整個過程很細心，連排水溝都幫我清理乾淨了。',
      rating: 5,
      service: '洗屋頂',
    ),
    TestimonialModel(
      id: 2,
      name: '陳小姐',
      title: '店家老闆',
      location: '草屯鎮',
      content: '店面重新粉刷後，客人都說變得很有質感。塗新居的團隊很準時，而且不會影響我們營業，真的很貼心。',
      rating: 5,
      service: '室內油漆',
    ),
    TestimonialModel(
      id: 3,
      name: '張大哥',
      title: '農舍屋主',
      location: '埔里鎮',
      content: '困擾多年的屋頂漏水問題終於解決了！之前找了好幾家都沒用，塗新居真的很厲害，現在下再大的雨都不怕了。',
      rating: 5,
      service: '防水處理',
    ),
    TestimonialModel(
      id: 4,
      name: '王太太',
      title: '公寓住戶',
      location: '竹山鎮',
      content: '屋頂重新上漆後，夏天室內溫度明顯降低，冷氣費省了不少！而且師傅都有做好防護，完全不用擔心弄髒。',
      rating: 5,
      service: '油漆屋頂',
    ),
  ];

  // ============================================================================
  // 團隊成員
  // ============================================================================

  /// 團隊成員列表（3 人）
  static const List<TeamMemberModel> teamMembers = [
    TeamMemberModel(
      id: 1,
      name: '陳先生',
      role: '創辦人 / 總監',
      description: '對品質有著極高的堅持，帶領團隊追求卓越。',
    ),
    TeamMemberModel(
      id: 2,
      name: '陳先生',
      role: '工程主管',
      description: '專精防水工程，解決各種疑難雜症。',
    ),
    TeamMemberModel(
      id: 3,
      name: '陳先生',
      role: '資深師傅',
      description: '細心負責，客戶好評不斷的口碑師傅。',
    ),
  ];

  // ============================================================================
  // 常見問題
  // ============================================================================

  /// 常見問題列表（5 項）
  static const List<FaqModel> faqs = [
    FaqModel(
      id: 1,
      question: '洗屋頂需要多長時間？',
      answer: '視屋頂面積和髒污程度而定。我們會在到場評估後給您確切的時間。',
      category: 'roof-cleaning',
    ),
    FaqModel(
      id: 2,
      question: '油漆屋頂可以選擇什麼顏色？',
      answer: '我們提供多種顏色選擇，包括常見的灰色、綠色、紅色、藍色等。您也可以指定特定色號，我們會盡力為您調配。',
      category: 'roof-painting',
    ),
    FaqModel(
      id: 3,
      question: '室內油漆會有味道嗎？住戶需要搬出去嗎？',
      answer:
          '我們使用低 VOC 環保漆料，味道輕微且散發快速。一般建議施工當天保持通風，通常不需要搬出。如果家中有嬰幼兒或過敏體質者，可以暫時避開 1-2 天。',
      category: 'interior-painting',
    ),
    FaqModel(
      id: 4,
      question: '如何預約服務？',
      answer: '您可以透過網站表單、電話（0908-103-398）或 LINE 預約。我們會在 24 小時內回覆您，並安排免費到府評估。',
      category: 'general',
    ),
    FaqModel(
      id: 5,
      question: '報價是免費的嗎？',
      answer: '是的，我們提供免費到府評估報價服務。師傅會實際查看現場狀況後，給您詳細的報價單，絕不會有隱藏費用。',
      category: 'general',
    ),
  ];

  // ============================================================================
  // 博客文章
  // ============================================================================

  /// 博客文章列表（8 篇）
  static const List<BlogPostModel> blogPosts = [
    BlogPostModel(
      id: 1,
      slug: 'roof-cleaning-guide',
      title: '屋頂清洗完整指南：什麼時候該洗？怎麼洗最乾淨？',
      excerpt: '屋頂長年累積的青苔、污垢不僅影響美觀，更可能造成漏水問題。本文教您判斷清洗時機，以及專業清洗的正確步驟。',
      content: '',
      image: 'assets/images/blog/roof-cleaning-guide.jpg',
      category: '屋頂清洗',
      author: '陳先生',
      publishedAt: '2025-01-15',
      readTime: 5,
    ),
    BlogPostModel(
      id: 2,
      slug: 'waterproofing-tips',
      title: '南投潮濕氣候必讀：5 個防水工程重點',
      excerpt: '南投山區濕氣重，房屋防水格外重要。專家分享 5 個防水工程重點，幫助您的房屋遠離漏水困擾。',
      content: '',
      image: 'assets/images/blog/waterproofing-tips.jpg',
      category: '防水工程',
      author: '陳先生',
      publishedAt: '2025-01-10',
      readTime: 4,
    ),
    BlogPostModel(
      id: 3,
      slug: 'paint-color-selection',
      title: '室內油漆顏色怎麼選？設計師推薦的配色技巧',
      excerpt: '選對油漆顏色可以讓空間看起來更大、更舒適。本文分享專業設計師的配色建議，幫助您打造理想居家空間。',
      content: '',
      image: 'assets/images/blog/paint-color-selection.jpg',
      category: '室內油漆',
      author: '陳先生',
      publishedAt: '2025-01-05',
      readTime: 6,
    ),
    BlogPostModel(
      id: 4,
      slug: 'roof-painting-benefits',
      title: '屋頂油漆的 4 大好處：不只是美觀那麼簡單',
      excerpt: '屋頂油漆除了美化外觀，還有隔熱、防鏽、延長壽命等多重好處。了解這些優點，讓您的投資更有價值。',
      content: '',
      image: 'assets/images/blog/roof-painting-benefits.jpg',
      category: '屋頂油漆',
      author: '陳先生',
      publishedAt: '2024-12-28',
      readTime: 4,
    ),
    BlogPostModel(
      id: 5,
      slug: 'exterior-wall-cleaning',
      title: '外牆清洗保養全攻略：讓您的房子重現光彩',
      excerpt: '外牆經年累月受到風吹雨打、灰塵污染，容易變得髒污暗沉。本文分享專業外牆清洗方法與日常保養技巧，讓您的房屋外觀持久亮麗。',
      content: '',
      image: 'assets/images/blog/exterior-wall-cleaning.jpg',
      category: '外牆清洗',
      author: '陳先生',
      publishedAt: '2024-12-20',
      readTime: 5,
    ),
    BlogPostModel(
      id: 6,
      slug: 'waterproof-coating-guide',
      title: '防水塗料怎麼選？專家教您挑選最適合的材料',
      excerpt: '市面上防水塗料種類繁多，PU、彈性水泥、矽利康各有優缺點。專家詳細解析各種材料特性，幫助您選擇最適合的防水方案。',
      content: '',
      image: 'assets/images/blog/waterproof-coating-guide.jpg',
      category: '防水工程',
      author: '陳先生',
      publishedAt: '2024-12-15',
      readTime: 6,
    ),
    BlogPostModel(
      id: 7,
      slug: 'old-house-renovation-paint',
      title: '老屋翻新必看：油漆前的準備工作與注意事項',
      excerpt: '老屋翻新不是直接上漆就好！牆面處理、壁癌處理、底漆施作都是關鍵步驟。了解正確流程，讓翻新效果更持久。',
      content: '',
      image: 'assets/images/blog/old-house-renovation-paint.jpg',
      category: '室內油漆',
      author: '陳先生',
      publishedAt: '2024-12-10',
      readTime: 7,
    ),
    BlogPostModel(
      id: 8,
      slug: 'roof-heat-insulation',
      title: '屋頂隔熱塗料效果好嗎？實測分析與選購建議',
      excerpt: '夏天頂樓熱到受不了？隔熱塗料真的有效嗎？本文透過實際案例分析隔熱塗料的效果，並提供選購與施工建議。',
      content: '',
      image: 'assets/images/blog/roof-heat-insulation.jpg',
      category: '屋頂油漆',
      author: '陳先生',
      publishedAt: '2024-12-05',
      readTime: 5,
    ),
  ];

  // ============================================================================
  // 作品案例
  // ============================================================================

  /// 作品案例列表（3 項）
  static const List<PortfolioItemModel> portfolioItems = [
    PortfolioItemModel(
      id: 1,
      title: '南投市透天厝屋頂清洗',
      description: '30 年老屋屋頂，青苔覆蓋嚴重，經過專業高壓清洗後煥然一新。',
      category: 'roof-cleaning',
      location: '南投市',
      beforeImage: 'assets/images/portfolio/case-1-before.jpg',
      afterImage: 'assets/images/portfolio/case-1-after.jpg',
      completedAt: '2025-01',
    ),
    PortfolioItemModel(
      id: 2,
      title: '草屯鎮別墅室內全室粉刷',
      description: '200 坪別墅室內全室重新粉刷，採用高級環保漆料，呈現高雅質感。',
      category: 'interior-painting',
      location: '草屯鎮',
      beforeImage: 'assets/images/portfolio/case-2-before.jpg',
      afterImage: 'assets/images/portfolio/case-2-after.jpg',
      completedAt: '2024-12',
    ),
    PortfolioItemModel(
      id: 3,
      title: '埔里鎮民宿屋頂防水工程',
      description: '解決長年漏水問題，全面翻新防水層。',
      category: 'waterproofing',
      location: '埔里鎮',
      beforeImage: 'assets/images/portfolio/case-3-before.jpg',
      afterImage: 'assets/images/portfolio/case-3-after.jpg',
      completedAt: '2024-11',
    ),
  ];

  // ============================================================================
  // 輔助方法
  // ============================================================================

  /// 根據 ID 取得服務項目
  static ServiceModel? getServiceById(String id) {
    try {
      return services.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  /// 根據 ID 取得作品案例
  static PortfolioItemModel? getPortfolioById(int id) {
    try {
      return portfolioItems.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  /// 根據 slug 取得博客文章
  static BlogPostModel? getBlogPostBySlug(String slug) {
    try {
      return blogPosts.firstWhere((b) => b.slug == slug);
    } catch (_) {
      return null;
    }
  }

  /// 根據 ID 取得博客文章
  static BlogPostModel? getBlogPostById(int id) {
    try {
      return blogPosts.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }

  /// 根據分類篩選 FAQ
  static List<FaqModel> getFaqsByCategory(String category) {
    if (category == 'all') return faqs;
    return faqs.where((f) => f.category == category).toList();
  }

  /// 根據分類篩選作品案例
  static List<PortfolioItemModel> getPortfolioByCategory(String category) {
    if (category == 'all') return portfolioItems;
    return portfolioItems.where((p) => p.category == category).toList();
  }
}
