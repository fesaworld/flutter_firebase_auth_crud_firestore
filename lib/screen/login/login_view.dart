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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SIGN IN PAGE',
                      style: title
                    ),
                    const SizedBox(height: 10),
                    const Text("Select one method to sign in"),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue.shade900)),
                          onPressed: () {
                            controller.anonymousLogin();
                          },
                          child: const Text("Anonymous")),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue.shade900)),
                          onPressed: () {
                            controller.emailLogin();
                          },
                          child: const Text("Email")),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue.shade900)),
                          onPressed: () {
                            controller.googleLogin();
                          },
                          child: const Text("Google Account")),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue.shade900)),
                          onPressed: () {
                            controller.phoneLogin();
                          },
                          child: const Text("Phone Number")),
                    )
                  ],
                )
              ),
            ),
          );
        }
    );
  }
}
