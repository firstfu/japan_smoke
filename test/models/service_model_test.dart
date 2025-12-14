/// ============================================================================
/// 檔案名稱：service_model_test.dart
/// 檔案描述：服務模型單元測試
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案包含 ServiceModel 的單元測試。
/// ============================================================================

import 'package:flutter_test/flutter_test.dart';
import 'package:paint/data/models/service_model.dart';

void main() {
  group('ServiceModel', () {
    const testService = ServiceModel(
      id: 'test-service',
      title: '測試服務',
      titleEn: 'Test Service',
      shortDesc: '這是一個測試服務的簡短描述',
      description: '這是一個測試服務的完整描述',
      features: ['特色一', '特色二', '特色三'],
      icon: 'test_icon',
      image: '/images/test.jpg',
    );

    test('should create ServiceModel with all required fields', () {
      expect(testService.id, 'test-service');
      expect(testService.title, '測試服務');
      expect(testService.titleEn, 'Test Service');
      expect(testService.shortDesc, '這是一個測試服務的簡短描述');
      expect(testService.description, '這是一個測試服務的完整描述');
      expect(testService.features.length, 3);
      expect(testService.icon, 'test_icon');
      expect(testService.image, '/images/test.jpg');
    });

    test('should convert to JSON correctly', () {
      final json = testService.toJson();

      expect(json['id'], 'test-service');
      expect(json['title'], '測試服務');
      expect(json['titleEn'], 'Test Service');
      expect(json['shortDesc'], '這是一個測試服務的簡短描述');
      expect(json['description'], '這是一個測試服務的完整描述');
      expect(json['features'], ['特色一', '特色二', '特色三']);
      expect(json['icon'], 'test_icon');
      expect(json['image'], '/images/test.jpg');
    });

    test('should create from JSON correctly', () {
      final json = {
        'id': 'json-service',
        'title': 'JSON 服務',
        'titleEn': 'JSON Service',
        'shortDesc': 'JSON 簡短描述',
        'description': 'JSON 完整描述',
        'features': ['特色 A', '特色 B'],
        'icon': 'json_icon',
        'image': '/images/json.jpg',
      };

      final service = ServiceModel.fromJson(json);

      expect(service.id, 'json-service');
      expect(service.title, 'JSON 服務');
      expect(service.features.length, 2);
    });

    test('should support equality comparison', () {
      const service1 = ServiceModel(
        id: 'same-id',
        title: '服務',
        titleEn: 'Service',
        shortDesc: '描述',
        description: '描述',
        features: ['特色'],
        icon: 'icon',
        image: '/image.jpg',
      );

      const service2 = ServiceModel(
        id: 'same-id',
        title: '服務',
        titleEn: 'Service',
        shortDesc: '描述',
        description: '描述',
        features: ['特色'],
        icon: 'icon',
        image: '/image.jpg',
      );

      expect(service1, equals(service2));
    });
  });
}
