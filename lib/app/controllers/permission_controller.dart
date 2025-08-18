import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final RxBool cameraPermissionGranted = false.obs;
  final RxBool locationPermissionGranted = false.obs;
  final RxBool storagePermissionGranted = false.obs;
  final RxBool notificationPermissionGranted = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    checkPermissions();
  }
  
  Future<void> checkPermissions() async {
    cameraPermissionGranted.value = await Permission.camera.isGranted;
    locationPermissionGranted.value = await Permission.location.isGranted;
    storagePermissionGranted.value = await Permission.storage.isGranted;
    notificationPermissionGranted.value = await Permission.notification.isGranted;
  }
  
  Future<bool> requestCameraPermission() async {
    if (await Permission.camera.isGranted) {
      cameraPermissionGranted.value = true;
      return true;
    } else {
      final status = await Permission.camera.request();
      cameraPermissionGranted.value = status.isGranted;
      return status.isGranted;
    }
  }
  
  Future<bool> requestLocationPermission() async {
    if (await Permission.location.isGranted) {
      locationPermissionGranted.value = true;
      return true;
    } else {
      final status = await Permission.location.request();
      locationPermissionGranted.value = status.isGranted;
      return status.isGranted;
    }
  }
  
  Future<bool> requestStoragePermission() async {
    if (await Permission.storage.isGranted) {
      storagePermissionGranted.value = true;
      return true;
    } else {
      final status = await Permission.storage.request();
      storagePermissionGranted.value = status.isGranted;
      return status.isGranted;
    }
  }
  
  Future<bool> requestNotificationPermission() async {
    if (await Permission.notification.isGranted) {
      notificationPermissionGranted.value = true;
      return true;
    } else {
      final status = await Permission.notification.request();
      notificationPermissionGranted.value = status.isGranted;
      return status.isGranted;
    }
  }
  
  Future<bool> requestAllPermissions() async {
    final camera = await requestCameraPermission();
    final location = await requestLocationPermission();
    final storage = await requestStoragePermission();
    final notification = await requestNotificationPermission();
    
    return camera && location && storage && notification;
  }
  
  bool get allPermissionsGranted => 
    cameraPermissionGranted.value && 
    locationPermissionGranted.value && 
    storagePermissionGranted.value && 
    notificationPermissionGranted.value;
}