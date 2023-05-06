import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_view.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../../widget/dialog/signin_dialog_widget.dart';

class LoginEmailController extends BaseController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> signupDialog() async {
    List data = await Get.dialog(
        barrierDismissible: false,
        SigninDialogWidget()
    );

    if (data.length > 0){
      signup(email: data[0], password: data[1]);
    }
  }

  Future signup({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      showSnackbar(
          title: 'Success',
          subTitle: 'User has been created'
      );
    }
    on FirebaseException catch (e) {
      print(e.message);
      showSnackbar(
          title: 'Error',
          subTitle: e.message
      );
    }
  }

  Future login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      Get.offAll(const MainpageView());
    }
    on FirebaseException catch (e) {
      print(e.message);
      showSnackbar(
          title: 'Error',
          subTitle: e.message
      );
    }
  }

  Future forgot({required String email}) async {
    try {
      if(email.isNotEmpty){
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: email,
        );

        showSnackbar(
            title: 'Success',
            subTitle: 'Password reset email has been sent '
        );
      }else{
        showSnackbar(
            title: 'Error',
            subTitle: 'Email cannot be empty'
        );
      }
    }
    on FirebaseException catch (e) {
      print(e.message);
      showSnackbar(
          title: 'Error',
          subTitle: e.message
      );
    }
  }

  void showSnackbar({required String title, required subTitle,}){
    Get.snackbar(
      title,
      subTitle,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      icon: const Icon(Icons.warning, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5)
    );
  }
}