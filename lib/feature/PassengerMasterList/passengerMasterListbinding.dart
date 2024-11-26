
import 'package:get/get.dart';
import 'passengerMasterListcontroller.dart';

class PassengerMasterListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PassengerMasterListController());
  }

}
