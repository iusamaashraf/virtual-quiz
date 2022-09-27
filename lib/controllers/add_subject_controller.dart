import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/models/subject_model.dart';
import 'package:quiz_app/utils/loading_dialog.dart';

class AddSubjectController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<List<SubjectModel>> subjectModel = Rxn<List<SubjectModel>>();
  List<SubjectModel>? get subject => subjectModel.value;
  Rxn<List<QuestionModel>> questionModel = Rxn<List<QuestionModel>>();
  List<QuestionModel>? get question => questionModel.value;
  // <<<================= onInit Method ========================>>>
  @override
  void onInit() {
    subjectModel.bindStream(subjectList());
    super.onInit();
  }

  // <<<================= add Subject ==========================>>>
  void addSubject(String subject, context) async {
    // Utils.showLoadingDialog(context);
    await firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("Subjects")
        .doc()
        .set({
      'subjectName': subject,
    }).then(
      (value) {
        Get.back();
      },
    );
  }

  // <<<================= check subject already exists or not =============>>>>
  bool doesSubjectExists(String name) {
    bool isExist = false;
    for (int element = 0; element < subjectModel.value!.length; element++) {
      print('other name is ${subjectModel.value![element].subjectName}');
      if (name == subjectModel.value![element].subjectName) {
        isExist = true;
        print(name);
      }
    }
    return isExist;
  }

  // RxBool isSubjectExists = false.obs;
  // Stream<List<SubjectModel>> doesNameAlreadyExist(String name) {
  //   print('done: ${name}');
  //   return firestore
  //       .collection("Users")
  //       .doc(auth.currentUser!.uid)
  //       .collection("Subjects")
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<SubjectModel> retVal = [];

  //     for (var element in query.docs) {
  //       if (name == element['subjectName']) {
  //         // isSubjectExists.value = true;
  //         Get.snackbar("Exists", "Your subject is already exists");
  //       } else {
  //         // isSubjectExists.value = false;
  //         Get.snackbar("Added", "message");
  //         retVal.add(SubjectModel.fromSnapshot(element));
  //         // Get.back();
  //       }
  //     }

  //     return retVal;
  //   });
  // }
  // <<<================= Get Subject Stream ==========================>>>

  Stream<List<SubjectModel>> subjectList() {
    return firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("Subjects")
        .snapshots()
        .map((QuerySnapshot query) {
      List<SubjectModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(SubjectModel.fromSnapshot(element));
      }
      return retVal;
    });
  }

  // <<<========================= add Questions ========================>>>>
  void addQuestion(
    String subjectId,
    String question,
    String optionA,
    String optionB,
    String optionC,
    String optionD,
    String correctOption,
  ) async {
    await firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("Subjects")
        .doc(subjectId)
        .collection("Questions")
        .doc()
        .set({
      'Question': question,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'optionD': optionD,
      'correctOption': correctOption,
    });
  }

  //<<<<======================== Questions exist or not =================================>>>>
  bool doesQuestionsExist(String que) {
    bool isExist = false;
    for (int i = 0; i < question!.length; i++) {
      print("All questions are: $i");
      if (que == question![i].question) {
        isExist = true;
        print('Actual question is: $que');
      }
    }
    return isExist;
  }

  // <<<<============================= function for getting all question ==============================>>>>
  getQuestionList(String subjectId) {
    questionModel.bindStream(questionsList(subjectId));
  }

  // <<< ============================== get questions Stream ==========================>>>>
  Stream<List<QuestionModel>> questionsList(String subjectId) {
    return firestore
        .collection("Users")
        .doc(auth.currentUser!.uid)
        .collection("Subjects")
        .doc(subjectId)
        .collection("Questions")
        .snapshots()
        .map((QuerySnapshot query) {
      List<QuestionModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(QuestionModel.fromSnapshot(element));
      }
      return retVal;
    });
  }
}
