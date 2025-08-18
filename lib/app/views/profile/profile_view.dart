import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '내정보',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Form
              _buildProfileForm(),
              
              SizedBox(height: 24.0),
              
              // Update Button
              CustomButton(
                text: '확인하기',
                onPressed: () => controller.updateProfile(),
                backgroundColor: Theme.of(context).primaryColor,
                width: double.infinity,
              ),
            ],
          ),
        );
      }),
    );
  }
  
  Widget _buildProfileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name Field
        CustomTextField(
          labelText: '이름',
          hintText: '이름을 입력하세요',
          controller: controller.nameController,
          required: true,
        ),
        SizedBox(height: 16.0),
        
        // Email Field
        CustomTextField(
          labelText: '이메일',
          hintText: '이메일을 입력하세요',
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          required: true,
        ),
        SizedBox(height: 16.0),
        
        // Phone Field
        CustomTextField(
          labelText: '전화번호',
          hintText: '전화번호를 입력하세요',
          controller: controller.phoneController,
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 16.0),
        
        // Website Field
        CustomTextField(
          labelText: '웹사이트',
          hintText: '웹사이트 주소를 입력하세요',
          controller: controller.websiteController,
          keyboardType: TextInputType.url,
          suffixIcon: Icon(Icons.link),
        ),
        SizedBox(height: 16.0),
        
        // Additional Fields
        CustomTextField(
          labelText: '생년월일',
          hintText: 'YYYY-MM-DD',
          readOnly: true,
          onTap: () {
            // Show date picker
          },
          suffixIcon: Icon(Icons.calendar_today),
        ),
        SizedBox(height: 16.0),
        
        CustomTextField(
          labelText: '성별',
          hintText: '성별을 선택하세요',
          readOnly: true,
          onTap: () {
            // Show gender selection
          },
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        SizedBox(height: 16.0),
        
        // Terms and Conditions
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
              activeColor: Theme.of(Get.context!).primaryColor,
            ),
            Expanded(
              child: Text(
                '이용약관 및 개인정보 처리방침에 동의합니다.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
              activeColor: Theme.of(Get.context!).primaryColor,
            ),
            Expanded(
              child: Text(
                '마케팅 정보 수신에 동의합니다.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}