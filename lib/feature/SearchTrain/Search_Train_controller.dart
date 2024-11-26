
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawan_test2/core/globals.dart' as gbl;
import 'package:pawan_test2/helper/UiHelper.dart';
import '../../firebase_services/firebase_auth_services.dart';

class SearchTrainController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  var selectedStation = ''.obs;
  String? classValue;
  String? quotaValue;
  RxBool formValid = false.obs;
   File? file;
  
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  void showCalender() async {
    DateTime? userSelectDate = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    if (userSelectDate != null) {
      dateController.text =
          "${userSelectDate.year}-${userSelectDate.month}-${userSelectDate.day}";
    } else {
      print('date not selected');
    }
  }

  void showFromList() {
    showModalBottomSheet(
      context: Get.overlayContext!,
      builder: (context) {
        return  Wrap(
        children: [
          const SizedBox(height: 10,),
          customList("Gwalior",fromController),
          customList("Bhopal",fromController),
          customList("Indore",fromController),
          customList("Banglore",fromController),
          customList("Bhind",fromController),
          ],
        );
      },
    );
  }

  ListTile customList(String cityname,TextEditingController myController) {
    return ListTile(
            focusColor: Colors.transparent,
            contentPadding:const EdgeInsets.all(15),
            title: Text(cityname,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),),
            onTap: (){
              myController.text = cityname;
              Get.back();
            },
          );
  }

  void showToList() {
    showModalBottomSheet(
      context: Get.overlayContext!,
      builder: (context) {
        return Wrap(
          children: [
           const SizedBox(height: 10,),
          customList("Gwalior",toController),
          customList("Bhopal",toController),
          customList("Indore",toController),
          customList("Banglore",toController),
          customList("Bhind",toController),
          ],
        );
      },
    );
  }

  void checkValidation() {
    if(formKey.currentState!.validate()){
      formValid.value = true;
    }
    else{
      return ;
    }
  }

 Future<void> getImage() async {
  customDialog();
    ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery,imageQuality: 5);
    
    if (pickedFile != null) {
      file = File(pickedFile.path);
      await uploadImage();
    } else {
      Get.back();
        Get.snackbar('Error', 'Image Not selected',
        backgroundColor: Colors.red);
    }
  }

  Future<void> uploadImage() async {
    if (file != null) {
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        String fileName = 'profilePic/${DateTime.now().millisecondsSinceEpoch}';
        UploadTask uploadTask = storage.ref().child(fileName).putFile(file!);
        TaskSnapshot taskSnapshot = await uploadTask;
        
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        gbl.userProfile.value = downloadUrl;
        FirebaseAuthService.setProfile();
        Get.back();
        Get.snackbar('Profile Picture', 'Profile picture updated successfully',
            backgroundColor: const Color(0xFF0DEC14));
      } catch (e) {
        Get.back();
        Get.snackbar('Error', 'Failed to update profile picture',
            backgroundColor: Colors.red);
      }
    } else {
       Get.back();
        Get.snackbar('Error', 'Failed to update profile picture',
        backgroundColor: Colors.red);
    }
  }

  
}


