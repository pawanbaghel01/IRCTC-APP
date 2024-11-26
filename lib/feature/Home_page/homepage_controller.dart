

import 'package:get/get.dart';
import 'package:pawan_test2/Routing/routeConstant.dart';

class HomePageController extends GetxController {

  void toAddPassengerPage() {
    Get.toNamed(RouteConstant.addPassengerpage);
  }

  void toFindTrain() {
    Get.toNamed(RouteConstant.searchTrainpage);
  }
}