import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final RxString name = ''.obs;
  final RxString email = ''.obs;
  final RxString phone = ''.obs;
  final RxString website = ''.obs;
  final RxBool isLoading = false.obs;
  
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  
  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }
  
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    websiteController.dispose();
    super.onClose();
  }
  
  Future<void> fetchUserProfile() async {
    isLoading.value = true;
    
    try {
      // Simulate API call with delay
      await Future.delayed(Duration(milliseconds: 800));
      
      // Mock user data
      name.value = 'Vanessa';
      email.value = 'user123@example.com';
      phone.value = '010 1234 5678';
      website.value = 'https://www.naver.com/';
      
      // Set controller values
      nameController.text = name.value;
      emailController.text = email.value;
      phoneController.text = phone.value;
      websiteController.text = website.value;
    } catch (e) {
      print('Error fetching user profile: $e');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> updateProfile() async {
    isLoading.value = true;
    
    try {
      // Validate inputs
      if (nameController.text.isEmpty || emailController.text.isEmpty) {
        Get.snackbar(
          '오류',
          '이름과 이메일은 필수 입력 항목입니다.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      
      // Simulate API call with delay
      await Future.delayed(Duration(milliseconds: 800));
      
      // Update values
      name.value = nameController.text;
      email.value = emailController.text;
      phone.value = phoneController.text;
      website.value = websiteController.text;
      
      Get.snackbar(
        '성공',
        '프로필이 업데이트되었습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print('Error updating profile: $e');
      Get.snackbar(
        '오류',
        '프로필 업데이트 중 오류가 발생했습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}