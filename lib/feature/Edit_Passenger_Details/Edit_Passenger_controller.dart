
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/Routing/routeConstant.dart';
import 'package:pawan_test2/helper/UiHelper.dart';

class EditPassengerController extends GetxController {

 TextEditingController nameController = TextEditingController();
 TextEditingController ageController = TextEditingController();
 TextEditingController addressController = TextEditingController();
 TextEditingController mobileController = TextEditingController();
 GlobalKey<FormState> editFormKey = GlobalKey();
 RxInt gender = 0.obs;
 RxString preferences =''.obs;
 RxString genderText=''.obs;
 FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 List preferencesList = [];

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
    }
     else {
      return gender.value;
    }
  }
  
  void checkValidation(String documentId){
     bool isValidate = editFormKey.currentState!.validate();
    if (!isValidate) {
      return;
    } else if (gender == 0) {
      Get.snackbar("Please Select Gender", '');
      return;
    }
    else if(preferences.value == ''){
     Get.snackbar("Please Select Preferences", '');
      return;
    }
    else{
    updatePassengerList(documentId);
    }

  }


 Future<void> updatePassengerList(String documentId) async {
    
    customDialog();  
    await firebaseFirestore
        .collection('passengerList')
        .doc(documentId)
        .update({'Age': ageController.text, 'Address': addressController.text,
        'MobileNumber':mobileController.text,'Gender':genderText.value});
      Get.back();
      showDoneStatus();
      
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
              'Thank you, your information has been Edited',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(Get.overlayContext!);
              Get.back();
              Get.offNamed(RouteConstant.passengerListpage);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
            child:const Text(
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
