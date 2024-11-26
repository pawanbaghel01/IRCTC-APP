import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawan_test2/core/globals.dart' as gbl;
import 'package:pawan_test2/helper/UiHelper.dart';
import '../../Routing/routeConstant.dart';
import '../../firebase_services/firebase_auth_services.dart';
import '../../firebase_services/firebse_firestore_services.dart';

class LoginPageController extends GetxController {
  RxBool isSet = true.obs;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  late UserCredential user;
  FirebaseAuth auth = FirebaseAuth.instance;

  void checkValidation() {
    if (loginKey.currentState!.validate()) {
      loginWithEmailPassword();
      FirebaseFireStoreService.fetchUserDocument();
    }
    return;
  }

  void loginWithPhone() {
    Get.toNamed(RouteConstant.phoneAuthpage);
  }

  void loginWithGoogle() async {
    FirebaseAuthService.signUpWithGoogle();
  }

  void loginWithFacebook() async {
    print('this method not complete');
    print("FaceBook");
    customDialog();
    try {
      print('try for facebook login');
      final result =
      await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
        Get.back();
        Get.offAll(RouteConstant.deshpage);
        print('facebook login succesfull');
      }
      else{
        print('inside else condition');
        Get.back();
           Get.snackbar("An Error Occured", 'Some error occured',
            backgroundColor: const Color(0xE4EC0909));
      }
    } catch (e) {
      Get.back();
      print('error occured');
      print(e.toString());
       Get.snackbar("An Error Occured", e.toString(),
            backgroundColor: const Color(0xE4EC0909));
    }
  }

  Future<void> loginWithEmailPassword() async {
    customDialog();
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passWordController.text.trim());
      if (credential.user != null) {
        Get.snackbar('Registration', 'User Login Successfully',
            backgroundColor: const Color(0xFF16F01E));
        gbl.isLogin.value = true;
        FirebaseAuthService.setLoginValue();
        Get.back();
        Get.offAllNamed(RouteConstant.deshpage);
      } else {
        Get.back();
        Get.snackbar("An Error Occured", 'User Null',
            backgroundColor: const Color(0xE4EC0909));
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      Get.snackbar('An error accured', e.code,
          backgroundColor: const Color(0xFFF01616));
    } catch (e) {
      Get.back();
      Get.snackbar('An error accured', e.toString(),
          backgroundColor: const Color(0xFFF01616));
    }
  }
}
