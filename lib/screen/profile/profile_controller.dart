import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../login/login_view.dart';

class ProfileController extends BaseController{

  String? uuid;

  @override
  Future<void> onInit() async {
    super.onInit();

    uuid = FirebaseAuth.instance.currentUser?.uid;
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
}