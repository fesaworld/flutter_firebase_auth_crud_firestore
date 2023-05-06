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
                child: Text(
                  'Mainpage Body',
                  style: subTitle,
                ),
              ),
            ),
          );
        }
    );
  }
}
