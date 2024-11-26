
import 'package:get/get.dart';
import 'package:pawan_test2/feature/Home_page/homepage_controller.dart';

class HomePageBinding extends Bindings{
   
   @override
     void dependencies(){
     Get.lazyPut(() => HomePageController());
   }
}