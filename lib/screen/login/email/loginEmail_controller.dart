import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_view.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';

class LoginEmailController extends BaseController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  void signupDialog() {

  }

  Future signup({required String email, required String password}) async {

  }

  Future login({required String email, required String password}) async {

  }

  void forgot({required String email}) {

  }
}