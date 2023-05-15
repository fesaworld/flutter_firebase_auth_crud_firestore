import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:flutter_firebase_auth_crud_firestore/data/secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../login/login_view.dart';

class ProfileController extends BaseController{

  final Storage _storage = Storage();
  String? uuid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? userCollection;

  final ImagePicker picker = ImagePicker();
  bool havePicture = false;
  String? id;
  String? imageLink;

  @override
  Future<void> onInit() async {
    uuid = await _storage.readUid();
    userCollection = firestore.collection('users');

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

  Future uploadImage({required String uuid}) async {

    XFile? filePicker = await picker.pickImage(source: ImageSource.gallery);

    if(filePicker != null){
      String fileName = basename(filePicker.path);

      var ref = FirebaseStorage.instance.ref().child(fileName);
      var task = ref.putFile(File(filePicker.path.toString()));
      var snapshot = task.snapshot;
      var link = await snapshot.ref.getDownloadURL();

      imageLink = link.toString();
      uploadPicture(
          uuid: uuid,
          profileImage: link.toString()
      );
    }

    update();
  }

  Future uploadPicture(
      {required String uuid,
        required String profileImage}) async {

    if(havePicture){
      await userCollection?.doc(id).update({
        'profileImage': profileImage,
        'timestamp': DateTime.now()
      });
    }else{
      await userCollection?.add({
        'uuid': uuid,
        'profileImage': profileImage,
        'timestamp': DateTime.now()
      });
    }

    // readData(uuid:uuid);
  }
}