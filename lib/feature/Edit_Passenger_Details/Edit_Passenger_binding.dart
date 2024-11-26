

import 'package:get/get.dart';

import 'Edit_Passenger_controller.dart';

class EditPassengerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditPassengerController());
    // TODO: implement dependencies
  }

}