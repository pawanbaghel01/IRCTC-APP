import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFireStoreService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static saveUser({required dynamic model,required String collection }) async {
    firestore.collection(collection)
        .add(model.toMap())
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  static void fetchUserDocument() async {
  User? user = FirebaseAuth.instance.currentUser;
   // Stream<QuerySnapshot<Map<String, dynamic>>> queryDocumentSnapshot =  FirebaseFirestore.instance.collection('registerUser').snapshots();
  
  if (user != null) {
    Query<Map<String, dynamic>> doc = FirebaseFirestore.instance.collection('registerUser')
    .where('Email',isEqualTo: user.email);
    print('document print');
    print(doc.get());
    // DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('registerUser').doc("x9vJ8FZAQbbVnU1aNgCk").get();
    // if (userDoc.exists) {
    //   gbl.userProfile.value = userDoc['Profile'];
    //   print("User Document Data: ${userDoc.data()}");
     }
     else {
      
      print("No such document!");
    }
  }
  
}

  //  () async {
  //               if (controller.contentController.text.isNotEmpty) {
  //                 print('hello i am here line 31');
  //                 HrmModel newHrmData = HrmModel(
  //                     id: '',
  //                     content: controller.contentController.text,
  //                     createdOn: Timestamp.now(),
  //                     profilepic: '',
  //                     name: controller.nameController.text);
  //                 await controller.addData(newHrmData);
                
  //                 Get.snackbar('successful', 'add successful form');

  //                 Get.back(); // Close the add todo page
  //               } else {
  //                 Get.snackbar(
  //                   'Error',
  //                   'Content cannot be empty',
  //                   snackPosition: SnackPosition.BOTTOM,
  //                 );
  //               }
  //             },