import 'package:get/get.dart';
import '../views/splash/splash_view.dart';
import '../views/home/home_view.dart';
import '../views/campaign_details/campaign_details_view.dart';
import '../views/profile/profile_view.dart';
import '../views/settings/settings_view.dart';
import '../views/permissions/permissions_view.dart';
import '../controllers/home_controller.dart';
import '../controllers/campaign_controller.dart';
import '../controllers/profile_controller.dart';
import '../controllers/permission_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.CAMPAIGN_DETAILS,
      page: () => CampaignDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CampaignController>(() => CampaignController());
      }),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => SettingsView(),
    ),
    GetPage(
      name: AppRoutes.PERMISSIONS,
      page: () => PermissionsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PermissionController>(() => PermissionController());
      }),
    ),
  ];
}