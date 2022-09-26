
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? profileImage;
  UserProfileModel({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });
  UserProfileModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    email = data['email'] ?? '';
    firstName = data['firstName'] ?? '';
    lastName = data['lastName'] ?? '';
    profileImage = data['profileImage'] ?? '';
  }
}
