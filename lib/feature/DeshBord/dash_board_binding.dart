import 'package:get/get.dart';
import 'package:pawan_test2/feature/settingspage/setting_page_controller.dart';
import '../Home_page/homepage_controller.dart';
import 'dash_board_contoller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomePageController());
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => SettingPageController());
  }
}
