/// ============================================================================
/// 檔案名稱：contact_page.dart
/// 檔案描述：聯絡我們頁面
/// 建立日期：2025-01-13
/// 作者：Claude Code
///
/// 本檔案定義聯絡我們頁面，包含聯絡資訊和預約表單。
/// ============================================================================

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/datasources/local/app_data.dart';

/// 聯絡我們頁面
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  String? _selectedService;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.navContact),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 聯絡資訊
            _buildContactInfo(context),

            // 預約表單
            _buildContactForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '聯絡我們',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textLight,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '歡迎聯絡我們，我們會在 24 小時內回覆您！',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.textLight.withValues(alpha: 0.9),
                ),
          ),
          const SizedBox(height: 24),
          // 電話
          InkWell(
            onTap: () => _makePhoneCall(AppData.company.phone),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.textLight.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.phone,
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '電話',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textLight.withValues(alpha: 0.7),
                          ),
                    ),
                    Text(
                      AppData.company.phone,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textLight,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // 營業時間
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.textLight.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.access_time,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '營業時間',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textLight.withValues(alpha: 0.7),
                        ),
                  ),
                  Text(
                    AppData.company.hours,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textLight,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '預約服務',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '填寫以下表單，我們會盡快與您聯絡安排免費評估！',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // 姓名
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.formName,
                    hintText: AppStrings.formNameHint,
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validationRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 電話
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.formPhone,
                    hintText: AppStrings.formPhoneHint,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.validationRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 電子郵件
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.formEmail,
                    hintText: AppStrings.formEmailHint,
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // 服務項目
                DropdownButtonFormField<String>(
                  initialValue: _selectedService,
                  decoration: const InputDecoration(
                    labelText: AppStrings.formService,
                    hintText: AppStrings.formServiceHint,
                    prefixIcon: Icon(Icons.build),
                  ),
                  items: AppData.services.map((service) {
                    return DropdownMenuItem(
                      value: service.id,
                      child: Text(service.title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedService = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return AppStrings.validationRequired;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // 需求說明
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    labelText: AppStrings.formMessage,
                    hintText: AppStrings.formMessageHint,
                    prefixIcon: Icon(Icons.message),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: 24),

                // 送出按鈕
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.textPrimary,
                            ),
                          )
                        : const Text(AppStrings.btnSubmit),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // 模擬 API 請求
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(AppStrings.submitSuccess),
          backgroundColor: AppColors.success,
        ),
      );

      // 清空表單
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _messageController.clear();
      setState(() {
        _selectedService = null;
      });
    }
  }
}
