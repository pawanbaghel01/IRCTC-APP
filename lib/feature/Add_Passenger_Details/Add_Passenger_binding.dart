

import 'package:get/get.dart';
import 'package:pawan_test2/feature/Add_Passenger_Details/Add_Passenger_controller.dart';

class AddPassengerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddPassengerController());
    // TODO: implement dependencies
  }

}