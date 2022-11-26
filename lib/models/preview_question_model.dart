import 'package:cloud_firestore/cloud_firestore.dart';

class PreviewQuestionModel {
  String? id;
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? correctOption;
  bool? isSelect;
  PreviewQuestionModel({
    required this.id,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctOption,
    required this.isSelect,
  });
  PreviewQuestionModel.fromSnapshot(DocumentSnapshot data) {
    id = data.id;
    question = data['Question'] ?? '';
    optionA = data['optionA'] ?? '';
    optionB = data['optionB'] ?? '';
    optionC = data['optionC'] ?? '';
    optionD = data['optionD'] ?? '';
    correctOption = data['correctOption'] ?? '';
    isSelect = data['isSelect'] ?? false;
  }
}
