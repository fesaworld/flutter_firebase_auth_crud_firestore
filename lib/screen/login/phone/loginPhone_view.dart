import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/text_style.dart';
import 'loginPhone_controller.dart';

class LoginPhoneView extends StatelessWidget {
  const LoginPhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPhoneController>(
        init: LoginPhoneController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.orange.shade50,
            body: SafeArea(
                child: Center(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SIGN IN WITH PHONE', style: title),
                        const SizedBox(height: 10),
                        const Text("You haven't signed in yet"),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            validator: (phone){
                              if (phone!.isEmpty) {
                                return "Phone number cannot be empty";
                              }else if(phone!.length < 10) {
                                return "Minimum Phone number contain 10 characters";
                              }
                              return null;
                            },
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                prefixIcon: Padding(padding: EdgeInsets.all(15), child: Text('+62', style: title,)),
                                border: InputBorder.none,
                                hintText: 'Phone Number'
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.green.shade900)),
                              onPressed: () {
                                if(controller.formKey.currentState!.validate()) {
                                  controller.phoneLogin(
                                      phone: controller.phoneController.text
                                  );
                                }
                              },
                              child: const Text("Sign In")),
                        )
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
