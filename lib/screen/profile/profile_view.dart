import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/profile/profile_controller.dart';
import 'package:get/get.dart';
import '../../const/color_pallete.dart';
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
                  // const SizedBox(height: 10),
                  // Text('Welcome Mainpage', style: title),
                  // const SizedBox(height: 10),
                  // StreamBuilder<User?>(
                  //     stream: FirebaseAuth.instance.userChanges(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return Text('Log In: ${snapshot.data?.uid}');
                  //       } else {
                  //         return const Text("Select one method to sign in");
                  //       }
                  //     }),
                  // const SizedBox(height: 15),
                  // Text(controller.uuid ?? 'kosong'),
                  // const SizedBox(height: 15),
                  // SizedBox(
                  //   width: 150,
                  //   child: ElevatedButton(
                  //       style: ButtonStyle(
                  //           backgroundColor: MaterialStateProperty.all(
                  //               Colors.lightBlue.shade900)),
                  //       onPressed: () {
                  //         controller.logout();
                  //       },
                  //       child: const Text("Log Out")),
                  // ),

                  StreamBuilder<QuerySnapshot>(
                      stream: controller.userCollection
                          ?.where('uuid', isEqualTo: controller.uuid)
                          .snapshots(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                    Border.all(color: ColorPalette.primary),
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot.data?.docs.length != 0 ? snapshot.data?.docs[0]['profileImage'] : 'https://e7.pngegg.com/pngimages/178/595/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black-thumbnail.png'),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.green)),
                                    onPressed: () async {
                                      await controller.uploadImage(
                                          uuid: controller.uuid!);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.upload),
                                        Text(snapshot.data?.docs.length != 0 ? 'Update' : "Upload"),
                                      ],
                                    )),
                              ),
                              const SizedBox(height: 10),
                              Text('Welcome, ${snapshot.data?.docs.length != 0 ? snapshot.data?.docs[0]['username'] : 'guest'}', style: title),
                              const SizedBox(height: 10),
                              Text(
                                  'Log In: ${snapshot.data?.docs.length != 0 ? snapshot.data?.docs[0]['uuid'] : 'guest'}'),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            Colors.lightBlue.shade900)),
                                    onPressed: () {
                                      controller.logout();
                                    },
                                    child: const Text("Log Out")),
                              ),
                            ],
                          );
                        }else {
                          return Column(
                            children: [
                              CircularProgressIndicator.adaptive(),
                              SizedBox(height: 10,),
                              Text('Loading'),
                            ],
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
