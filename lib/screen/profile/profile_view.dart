import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/profile/profile_controller.dart';
import 'package:get/get.dart';
import '../../const/text_style.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text('Welcome Mainpage', style: title),
                  const SizedBox(height: 10),
                  StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('Log In: ${snapshot.data?.uid}');
                        } else {
                          return const Text("Select one method to sign in");
                        }
                      }),
                  const SizedBox(height: 15),
                  Text(controller.uuid ?? 'kosong'),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlue.shade900)),
                        onPressed: () {
                          controller.logout();
                        },
                        child: const Text("Log Out")),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
