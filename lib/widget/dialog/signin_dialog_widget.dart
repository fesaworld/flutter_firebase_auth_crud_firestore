import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/color_pallete.dart';
import '../../const/text_style.dart';

class SigninDialogWidget extends StatelessWidget {
  SigninDialogWidget({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange.shade50,
      title: Text('Register Email',style: title),
      content: Container(
        height: Get.height * 0.2,
        width: Get.width,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.all(7),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Email cannot be empty";
                    }else if(!RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email)) {
                      return "Email is invalid";
                    }
                    return null;
                  },
                  controller: emailController,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(7),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "Password cannot be empty";
                    }else if(password!.length < 6) {
                      return "Minimum password contain 6 characters";
                    }
                    return null;
                  },
                  controller: passwordController,
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.orange.shade900)),
                  onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      Get.back(result: [emailController.text, passwordController.text]);
                    }
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
                  onPressed: (){
                    Get.back(result: []);
                  },
                  child: const Text("Back")),
            ),
          ],
        ),
      ],
    );
  }
}