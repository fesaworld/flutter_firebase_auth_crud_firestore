import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/data/secure_storage.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_view.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';
import '../../bottomappbar/bottomappbar_view.dart';

class LoginPhoneController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final Storage _storage = Storage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  Future phoneLogin({required String phone}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+62$phone',
        verificationCompleted: (credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (exception) {
          showSnackbar(title: 'Error', subTitle: exception.message);
        },
        codeSent: (verificationId, resendCode) async {
          String? smsCode = await askingSMSCode(Get.context!);

          if (smsCode != null) {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId, smsCode: smsCode);

            try {
              await FirebaseAuth.instance.signInWithCredential(credential);
              await _storage.saveUid(FirebaseAuth.instance.currentUser!.uid);

              Get.offAll(const BottomappbarView());
            } on FirebaseException catch (e) {
              showSnackbar(title: 'Error', subTitle: e.message);
            }
          }
        },
        codeAutoRetrievalTimeout: (verificationId) {});
  }

  void showSnackbar({
    required String title,
    required subTitle,
  }) {
    Get.snackbar(title, subTitle,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        icon: const Icon(Icons.warning, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5));
  }

  Future<String?> askingSMSCode(BuildContext context) async {
    return await showDialog<String>(
        context: context,
        builder: (_) {
          TextEditingController controller = TextEditingController();

          return SimpleDialog(
              title: const Text('Please enter the SMS code sent to you'),
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  color: const Color.fromARGB(255, 240, 240, 240),
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'SMS Code'),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, controller.text);
                    },
                    child: Text('Confirm',
                        style: TextStyle(color: Colors.green.shade900)))
              ]);
        });
  }
}
