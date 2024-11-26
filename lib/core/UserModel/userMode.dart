import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  String id;
  String name;
  String profile;
  String email;
  String password;
  String mobileNumber;
  Timestamp createdOn;

  UserModel({
    required this.id,
    required this.name,
    required this.profile,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.createdOn,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(
      id: doc.id,
      name: doc['name'],
      profile:doc['profile'],
      email: doc['email'],
      createdOn: doc['createdon'],
      password: doc['password'],
      mobileNumber: doc['mobileNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Email': email,
      'Profile':profile,
      'Password': password,
      'MobileNumber':mobileNumber,
      'CreatedOn':createdOn,
    };
  }
}