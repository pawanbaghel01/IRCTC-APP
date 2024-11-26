
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/Routing/routeConstant.dart';
import 'package:pawan_test2/core/AddPassengerModel/passengerModel.dart';
import 'package:pawan_test2/helper/UiHelper.dart';
import '../../firebase_services/firebse_firestore_services.dart';

class AddPassengerController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageContorller = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  GlobalKey<FormState> addFormKey = GlobalKey();
  RxInt gender = 0.obs;
  RxString genderText = ''.obs;
  RxString preferences = ''.obs;
  List preferencesList = [
    'Lower',
    'Middle',
    'Upper',
    'No Preferences',
    'Side Lower',
    'Upper Lower',
  ];
  // this is select gender method
  int selectGender(int selectvalue) {
    if (selectvalue == 1) {
      gender.value = selectvalue;
      genderText.value = "Male";
      return gender.value;
    }
    if (selectvalue == 2) {
      gender.value = selectvalue;
      genderText.value = "Female";
      return gender.value;
    }
    if (selectvalue == 3) {
      gender.value = selectvalue;
      genderText.value = "Other";
      return gender.value;
    } else {
      return gender.value;
    }
  }

  void checkValidation() {
    bool isValidate = addFormKey.currentState!.validate();
    if (!isValidate) {
      return;
    } else if (gender == 0) {
      Get.snackbar("Please Select Gender", '');
      return;
    } else if (preferences.value == '') {
      Get.snackbar("Please Select Preferences", '');
      return;
    } else {
      customDialog();
      PassengerModel passengerModel = PassengerModel(
        id: '',
        name: nameController.text.trim(),
        age: ageContorller.text,
        gender: genderText.value,
        preferences: preferences.value,
        mobileNumber: mobileController.text.trim(),
        address: addressController.text.trim(),
        createdOn: Timestamp.now(),
      );
      FirebaseFireStoreService.saveUser(
          model: passengerModel, collection: "passengerList");
          Get.back();
      showDoneStatus();
    }
  }

  void showDoneStatus() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: 'Success',
        content: Column(
          children: [
            Image.asset(
              'assets/successful.png',
              height: 100,
            ),
            const Text(
              'Thank you, your information has been saved',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAndToNamed(RouteConstant.passengerListpage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child: const Text(
              'Ok',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )
        ]);

  }
}
