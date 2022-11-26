import 'package:get/get.dart';
import 'package:quiz_app/models/questions_model.dart';

class PreviewController extends GetxController {
  // List<QuestionModel> questionList = [];
  final Rxn<List<QuestionModel>> _previewQuestionList =
      Rxn<List<QuestionModel>>();
  List<QuestionModel>? get preview => _previewQuestionList.value;
}
