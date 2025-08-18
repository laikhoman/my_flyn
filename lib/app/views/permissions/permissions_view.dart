import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/permission_controller.dart';
import '../../widgets/custom_button.dart';

class PermissionsView extends GetView<PermissionController> {
  const PermissionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '권한설정',
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              '앱 사용을 위한 권한을 설정해주세요.',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '원활한 서비스 이용을 위해 다음 권한이 필요합니다.',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24.0),
            
            // Permission Items
            _buildPermissionItem(
              icon: Icons.camera_alt_outlined,
              title: '카메라',
              description: '사진 촬영 및 QR 코드 스캔을 위해 필요합니다.',
              permissionStatus: controller.cameraPermissionGranted,
              onRequestPermission: () => controller.requestCameraPermission(),
            ),
            _buildPermissionItem(
              icon: Icons.location_on_outlined,
              title: '위치',
              description: '주변 캠페인 정보 제공을 위해 필요합니다.',
              permissionStatus: controller.locationPermissionGranted,
              onRequestPermission: () => controller.requestLocationPermission(),
            ),
            _buildPermissionItem(
              icon: Icons.folder_outlined,
              title: '저장소',
              description: '이미지 저장 및 파일 업로드를 위해 필요합니다.',
              permissionStatus: controller.storagePermissionGranted,
              onRequestPermission: () => controller.requestStoragePermission(),
            ),
            _buildPermissionItem(
              icon: Icons.notifications_outlined,
              title: '알림',
              description: '중요 알림 및 캠페인 정보 제공을 위해 필요합니다.',
              permissionStatus: controller.notificationPermissionGranted,
              onRequestPermission: () => controller.requestNotificationPermission(),
            ),
            SizedBox(height: 32.0),
            
            // Request All Permissions Button
            CustomButton(
              text: '모든 권한 허용하기',
              onPressed: () async {
                await controller.requestAllPermissions();
                if (controller.allPermissionsGranted) {
                  Get.back();
                }
              },
              backgroundColor: Theme.of(context).primaryColor,
              width: double.infinity,
            ),
            SizedBox(height: 16.0),
            
            // Skip Button
            Center(
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  '나중에 설정하기',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            
            // Note
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '참고사항',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '권한을 허용하지 않으면 일부 서비스 이용이 제한될 수 있습니다. 설정 > 앱 > MY FLYN > 권한에서 언제든지 변경할 수 있습니다.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPermissionItem({
    required IconData icon,
    required String title,
    required String description,
    required RxBool permissionStatus,
    required Future<bool> Function() onRequestPermission,
  }) {
    return Obx(() => Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(Get.context!).primaryColor,
              size: 24.0,
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 12.0),
                permissionStatus.value
                    ? Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          '허용됨',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: onRequestPermission,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          '권한 허용하기',
                          style: TextStyle(
                            color: Theme.of(Get.context!).primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}