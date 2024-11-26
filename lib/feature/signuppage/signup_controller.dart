import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/core/UserModel/userMode.dart';
import 'package:pawan_test2/core/globals.dart' as gbl;
import '../../Routing/routeConstant.dart';
import '../../firebase_services/firebase_auth_services.dart';
import '../../firebase_services/firebse_firestore_services.dart';
import '../../helper/UiHelper.dart';

class SignUpPageController extends GetxController {
  RxBool isSet = true.obs;
  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkValidation() {
    if (signupKey.currentState!.validate()) {
      createUser();
      UserModel userModel = UserModel(
          id: '',
          name: nameController.text,
          profile: '',
          email: emailController.text,
          password: passwordController.text,
          mobileNumber: mobileController.text,
          createdOn: Timestamp.now(),
          );
      FirebaseFireStoreService.saveUser(model: userModel,collection: "registerUser");
      
    }
    return;
  }

  void gotoLoginPage() {
    Get.offAllNamed(RouteConstant.loginpage);
  }

  Future<void> createUser() async {
    customDialog();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (credential.user != null) {
        
        gbl.isLogin.value = true;
        FirebaseAuthService.setLoginValue();
         Get.offAllNamed(RouteConstant.deshpage);
         Get.back();
        Get.snackbar('Registration', 'Create User Successfully',
            backgroundColor: const Color(0xFF16F01E));
      } else {
       Get.back();
        Get.snackbar("An Error Occured", 'User Null',
            backgroundColor: const Color(0xE4EC0909));
      }
    } on FirebaseAuthException catch (e) {
       Get.back();
      Get.snackbar("An Error Occured", e.code,
          backgroundColor: const Color(0xE4EC0909));
    } catch (e) {
       Get.back();
      Get.snackbar("", e.toString(), backgroundColor: const Color(0xFFF71313));
    }
  }

  void signUpWithGoogle() {
    FirebaseAuthService.signUpWithGoogle();
  }

   void signUpWithFacebook() async {
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
           Get.snackbar("An Error Occured", 'sum error occured',
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

  void signUpWithPhone() {
    Get.toNamed(RouteConstant.phoneAuthpage);
  }
}
