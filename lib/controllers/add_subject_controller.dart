import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/subject_model.dart';
import 'package:quiz_app/utils/loading_dialog.dart';

class AddSubjectController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<List<SubjectModel>> subjectModel = Rxn<List<SubjectModel>>();
  List<SubjectModel>? get subject => subjectModel.value;

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
  // <<<================= Get Subject List ==========================>>>

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
}
