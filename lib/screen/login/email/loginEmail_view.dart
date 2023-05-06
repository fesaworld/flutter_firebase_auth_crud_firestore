import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/const/text_style.dart';
import 'package:get/get.dart';

import 'loginEmail_controller.dart';

class LoginEmailView extends StatelessWidget {
  const LoginEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginEmailController>(
        init: LoginEmailController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.orange.shade50,
            body: SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* TITLE
                  Text('SIGN IN WITH EMAIL/PASSWORD', style: title),
                  const SizedBox(height: 10),
                  const Text("You haven't signed in yet"),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: controller.emailController,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: controller.passwordController,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange.shade900)),
                            onPressed: () async {
                              controller.signupDialog();
                            },
                            child: const Text("Sign Up")),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.orange.shade900)),
                            onPressed: () async {
                              controller.login(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text
                              );
                            },
                            child: const Text("Log In")),
                      ),
                    ],
                  ),
                  //* RESET PASSWORD BUTTON
                  TextButton(
                      onPressed: () async {
                        controller.forgot(email: controller.emailController.text);
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.orange.shade900),
                      ))
                ],
              ),
            )),
          );
        });
  }
}
