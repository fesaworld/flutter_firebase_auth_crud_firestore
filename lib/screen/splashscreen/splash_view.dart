import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/const/text_style.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/splashscreen/splash_controller.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.blue,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color(0x00009be5),
                    image: DecorationImage(
                        image: AssetImage('assets/image/background.png'),
                        fit: BoxFit.scaleDown)),
              ),
              SizedBox(height: 20,),
              Center(
                  child: Text(
                      'CRUD Learn APP',
                      style: title.copyWith(fontSize: 30)
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}
