
import 'package:cloud_firestore/cloud_firestore.dart';

class PassengerModel {
  String id;
  String name;
  String age;
  String gender;
  String preferences;
  String mobileNumber;
  String address;
  Timestamp createdOn;

  PassengerModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.preferences,
    required this.mobileNumber,
    required this.address,
    required this.createdOn,
  });

  factory PassengerModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return PassengerModel(
      id: doc.id,
      name: doc['name'],
      age: doc['age'],
      gender: doc['gender'],
      preferences: doc['preferences'],
      mobileNumber: doc['mobileNumber'],
      address: doc['address'],
      createdOn: doc['createdon'],
     
      
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Age': age,
      'Gender': gender,
      'Preferences':preferences,
      'MobileNumber':mobileNumber,
      'Address':address,
      'CreatedOn':createdOn,
    };
  }
}