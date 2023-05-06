import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/login_view.dart';
import 'package:get/get.dart';

class MainpageController extends BaseController{

  @override
  void onInit() {
  }

  void checkUser() {

  }

  void logout() {
    try {
      FirebaseAuth.instance.signOut();
      Get.offAll(const LoginView());
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

}