import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '기본정보',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Settings Sections
            _buildSettingsSection(context),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Account Settings
        _buildSectionHeader('계정'),
        _buildSettingsItem(
          icon: Icons.person_outline,
          title: '내정보',
          onTap: () => Get.toNamed(AppRoutes.PROFILE),
        ),
        _buildSettingsItem(
          icon: Icons.notifications_outlined,
          title: '알림 설정',
          onTap: () {},
        ),
        _buildSettingsItem(
          icon: Icons.lock_outline,
          title: '비밀번호 변경',
          onTap: () {},
        ),
        _buildDivider(),
        
        // App Settings
        _buildSectionHeader('앱 설정'),
        _buildSettingsItem(
          icon: Icons.language_outlined,
          title: '언어 설정',
          subtitle: '한국어',
          onTap: () {},
        ),
        _buildSettingsItem(
          icon: Icons.dark_mode_outlined,
          title: '다크 모드',
          isSwitch: true,
          switchValue: false,
          onSwitchChanged: (value) {},
        ),
        _buildSettingsItem(
          icon: Icons.location_on_outlined,
          title: '위치 서비스',
          isSwitch: true,
          switchValue: true,
          onSwitchChanged: (value) {},
        ),
        _buildDivider(),
        
        // Permissions
        _buildSectionHeader('권한'),
        _buildSettingsItem(
          icon: Icons.camera_alt_outlined,
          title: '카메라 권한',
          onTap: () => Get.toNamed(AppRoutes.PERMISSIONS),
        ),
        _buildSettingsItem(
          icon: Icons.folder_outlined,
          title: '저장소 권한',
          onTap: () => Get.toNamed(AppRoutes.PERMISSIONS),
        ),
        _buildDivider(),
        
        // About
        _buildSectionHeader('정보'),
        _buildSettingsItem(
          icon: Icons.info_outline,
          title: '앱 정보',
          subtitle: '버전 1.0.0',
          onTap: () {},
        ),
        _buildSettingsItem(
          icon: Icons.help_outline,
          title: '도움말',
          onTap: () {},
        ),
        _buildSettingsItem(
          icon: Icons.policy_outlined,
          title: '개인정보 처리방침',
          onTap: () {},
        ),
        _buildSettingsItem(
          icon: Icons.description_outlined,
          title: '이용약관',
          onTap: () {},
        ),
        _buildDivider(),
        
        // Logout
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextButton(
            onPressed: () {
              // Logout logic
              Get.offAllNamed(AppRoutes.SPLASH);
            },
            child: Text(
              '로그아웃',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.0),
      ],
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
  
  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isSwitch = false,
    bool? switchValue,
    Function(bool)? onSwitchChanged,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            )
          : null,
      trailing: isSwitch
          ? Switch(
              value: switchValue ?? false,
              onChanged: onSwitchChanged,
              activeColor: Get.theme.primaryColor,
            )
          : Icon(Icons.chevron_right, color: Colors.grey),
      onTap: isSwitch ? null : onTap,
    );
  }
  
  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 16.0,
      endIndent: 16.0,
    );
  }
}