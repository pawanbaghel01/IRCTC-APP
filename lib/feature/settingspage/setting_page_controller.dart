
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../Routing/routeConstant.dart';
import '../../core/globals.dart' as gbl;
import '../../firebase_services/firebase_auth_services.dart';

class SettingPageController extends GetxController{
 
  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(RouteConstant.loginpage);
      gbl.isLogin.value = false;
      gbl.userProfile.value = '';
      FirebaseAuthService.setProfile();
      FirebaseAuthService.setLoginValue(); // Navigate to login page after logout
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void showPassengerMasterList() {
    Get.toNamed(RouteConstant.passengerListpage);
  }
  
}