import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/const/text_style.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_controller.dart';
import 'package:get/get.dart';

class MainpageView extends StatelessWidget {
  const MainpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainpageController>(
        init: MainpageController(),
        builder: (controller){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'CRUD Learn APP',
                style: title,
              ),
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Welcome Mainpage',
                        style: title
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return Text('Log In: ${snapshot.data?.uid}');
                          }else{
                            return const Text("Select one method to sign in");
                          }
                        }
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue.shade900)),
                          onPressed: () {
                            controller.logout();
                          },
                          child: const Text("Log Out")),
                    ),
                  ],
                )
              ),
            ),
          );
        }
    );
  }
}
