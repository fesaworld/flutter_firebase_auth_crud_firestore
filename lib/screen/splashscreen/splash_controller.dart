import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/login_view.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_view.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';

class SplashController extends BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();

    timerStart();
  }

  void timerStart() async {
    Timer(const Duration(seconds: 3), () async {

      if(auth.currentUser != null){
        Get.offAll(const MainpageView());
      }else{
        Get.offAll(const LoginView());
      }
    });
  }
}