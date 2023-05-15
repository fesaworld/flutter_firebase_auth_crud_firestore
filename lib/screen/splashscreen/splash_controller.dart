import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/login_view.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';
import '../bottomappbar/bottomappbar_view.dart';

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
        Get.offAll(const BottomappbarView());
      }else{
        Get.offAll(const LoginView());
      }
    });
  }
}