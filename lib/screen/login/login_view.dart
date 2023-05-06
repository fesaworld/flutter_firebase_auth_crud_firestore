import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/login/login_controller.dart';
import 'package:get/get.dart';

import '../../const/text_style.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller){
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  'Login Body',
                  style: subTitle,
                ),
              ),
            ),
          );
        }
    );
  }
}
