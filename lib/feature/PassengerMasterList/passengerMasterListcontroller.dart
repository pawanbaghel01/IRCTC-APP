
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerMasterListController extends GetxController {
  RxBool isSearchClick = false.obs;
  RxString searchText = ''.obs;
  var searchController = TextEditingController();
  var nameController = TextEditingController();
  var contentController = TextEditingController();
  
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  Future<void> deletePassengerData(String documentId) async {
    await firebaseFirestore
        .collection('passengerList')
        .doc(documentId)
        .delete();
    Get.snackbar('Data Delete', 'Data Delete Successfully...',
        backgroundColor: Colors.red);
  }
  
}