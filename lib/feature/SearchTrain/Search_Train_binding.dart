
import 'package:get/get.dart';

import 'Search_Train_controller.dart';

class SearchTrainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SearchTrainController());
    // TODO: implement dependencies
  }

}