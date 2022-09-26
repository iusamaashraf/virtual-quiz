import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectModel {
  String? id;
  String? subjectName;
  SubjectModel({
    this.id,
    required this.subjectName,
  });
  SubjectModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    subjectName = data['subjectName'] ?? '';
  }
}
