import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:flutter_firebase_auth_crud_firestore/data/secure_storage.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/login_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../const/text_style.dart';
import '../../data/model/notes_model.dart';
import '../../widget/dialog/update_notes_dialog_widget.dart';

class MainpageController extends BaseController {
  final Storage _storage = Storage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? notesCollection;

  Notes? notesModel;
  List<Notes> noteList = [];
  String? uuid;
  bool isLoading = false;

  @override
  Future<void> onInit() async {
    uuid = await _storage.readUid();
    notesCollection = firestore.collection('notes');

    // readData(uuid: uuid!);
    update();
  }

  // Future readData({required String uuid}) async {
  //   noteList = [];
  //   isLoading = true;
  //   update();
  //
  //   try{
  //     QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
  //         .collection("notes")
  //         .where('uuid', isEqualTo: uuid)
  //         .orderBy('timestamp', descending: true)
  //         .get();
  //
  //     noteList = snapshot.docs
  //         .map((docSnapshot) => Notes.fromDocumentSnapshot(docSnapshot))
  //         .toList();
  //
  //     isLoading = false;
  //     update();
  //   } on FirebaseException catch (e){
  //     print(e.message);
  //   }
  // }

  Future createDataDialog({required String uuid}) async {
    List result = await Get.dialog(
        barrierDismissible: false,
        UpdateDialogWidget(
          isUpdate: false,
          titleNote: '',
          subTitleNote: '',
        ));

    if (result.isNotEmpty) {
      createData(uuid: uuid, title: result[0], body: result[1]);
    }else{
      Get.back();
    }
  }

  Future createData(
      {required String uuid,
        required String title,
        required String body}) async {
    await notesCollection?.add({
      'uuid': uuid,
      'title': title,
      'body': body,
      'timestamp': DateTime.now()
    });

    // readData(uuid:uuid);
  }

  Future updateDataDialog({required String id, required String uuid, required String title, required String subTitle}) async {
    List result = await Get.dialog(
        barrierDismissible: false,
        UpdateDialogWidget(
          isUpdate: true,
          titleNote: title,
          subTitleNote: subTitle,
        )
    );

    if (result.length > 1) {
      updateData(id: id, uuid: uuid, title: result[0], body: result[1]);
    }else if (result.length == 1 && result[0] == true) {
      deleteData(id: id, uuid: uuid);
    }else{
      Get.back();
    }
  }

  Future updateData(
      {required String id,
        required String uuid,
        required String title,
        required String body}) async {
    await notesCollection?.doc(id).update({
      'title': title,
      'body': body,
      'timestamp': DateTime.now()
    });

    // readData(uuid:uuid);
  }

  Future deleteData(
      {required String id, required String uuid}) async {
    await notesCollection?.doc(id).delete();
    // readData(uuid:uuid);
  }
}
