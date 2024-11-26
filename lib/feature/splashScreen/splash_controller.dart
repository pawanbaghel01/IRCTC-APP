import 'dart:async';
import 'package:get/get.dart';
import 'package:pawan_test2/core/globals.dart' as gbl;
import '../../Routing/routeConstant.dart';
import '../../firebase_services/firebase_auth_services.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    chekLoginStatus();
  // FirebaseFireStoreService.fetchUserDocument();
  }

  void chekLoginStatus(){
  // get login value
   FirebaseAuthService.getLoginValue();
  // splash screeen timer
    Timer(const Duration(seconds: 3), () {
      if (gbl.isLogin.value == true) {         
        Get.offAllNamed(RouteConstant.deshpage);
        FirebaseAuthService.getPfofile();
      } else {
        Get.offAllNamed(RouteConstant.loginpage);
      }
    });
  }

}
 
