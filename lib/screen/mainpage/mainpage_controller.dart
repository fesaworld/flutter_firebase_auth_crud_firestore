import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/login_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../const/text_style.dart';
import '../../data/model/notes_model.dart';
import '../../widget/dialog/update_notes_dialog_widget.dart';

class MainpageController extends BaseController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? notesCollection;

  List<Notes> noteList = [];
  String? uuid;
  bool isLoading = false;

  @override
  Future<void> onInit() async {
    uuid = FirebaseAuth.instance.currentUser?.uid;
    notesCollection = firestore.collection('notes');

    readData(uuid: uuid!);
    update();
  }

  void logout() {
    try {
      GoogleSignIn().signOut();
      FirebaseAuth.instance.signOut();
      Get.offAll(const LoginView());
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future readData({required String uuid}) async {
    noteList = [];
    isLoading = true;
    update();

    try{
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection("notes")
          .where('uuid', isEqualTo: uuid)
          .orderBy('timestamp', descending: false)
          .get();
      noteList = snapshot.docs
          .map((docSnapshot) => Notes.fromDocumentSnapshot(docSnapshot))
          .toList();

      isLoading = false;
      update();
    } on FirebaseException catch (e){
      print(e.message);
    }
  }
}
