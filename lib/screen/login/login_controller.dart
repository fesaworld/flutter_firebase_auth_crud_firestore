import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/email/loginEmail_view.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_view.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {

  void anonymousLogin() {
    try {
      FirebaseAuth.instance.signInAnonymously();
      Get.offAll(const MainpageView());
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  void emailLogin() {
    Get.offAll(const LoginEmailView());
  }

  void googleLogin() {

  }

  void phoneLogin() {

  }

}