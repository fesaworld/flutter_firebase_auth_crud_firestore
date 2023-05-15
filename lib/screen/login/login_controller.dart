import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/base/base_controller.dart';
import 'package:flutter_firebase_auth_crud_firestore/data/secure_storage.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/bottomappbar/bottomappbar_view.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/email/loginEmail_view.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/phone/loginPhone_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends BaseController {

  final Storage _storage = Storage();
  
  Future<void> anonymousLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      await _storage.saveUid(FirebaseAuth.instance.currentUser!.uid);

      Get.offAll(const BottomappbarView());


    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  void emailLogin() {
    Get.to(const LoginEmailView());
  }

  Future googleLogin() async {
    GoogleSignInAccount? account = await GoogleSignIn().signIn();
    if(account != null) {
      try {
        GoogleSignInAuthentication auth = await account.authentication;
        OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken: auth.idToken
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        await _storage.saveUid(FirebaseAuth.instance.currentUser!.uid);

        Get.offAll(const BottomappbarView());
      } on FirebaseException catch (e) {
        showSnackbar(
            title: 'Error',
            subTitle: e.message
        );
      }
    }
  }

  void phoneLogin() {
    Get.to(const LoginPhoneView());
  }

  void showSnackbar({required String title, required subTitle,}){
    Get.snackbar(
        title,
        subTitle,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5)
    );
  }
}