import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String? id;
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;
  QuestionModel({
    required this.id,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctOption,
  });
  QuestionModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    question = data['Question'] ?? '';
    optionA = data['optionA'] ?? '';
    optionB = data['optionB'] ?? '';
    optionC = data['optionC'] ?? '';
    optionD = data['optionD'] ?? '';
    correctOption = data['correctOption'] ?? '';
  }
}
