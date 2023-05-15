import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/const/text_style.dart';
import 'package:get/get.dart';

import '../../const/color_pallete.dart';
import 'bottomappbar_controller.dart';

class BottomappbarView extends StatelessWidget {
  const BottomappbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomappbarController>(
        init: BottomappbarController(),
        builder: (controller) {
          return Scaffold(
              body: controller.screen.elementAt(controller.indexHalaman),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 16,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: title,
                unselectedLabelStyle: subTitle,
                selectedIconTheme: const IconThemeData(color: ColorPalette.primary),
                unselectedIconTheme: const IconThemeData(color: ColorPalette.body),
                selectedItemColor: ColorPalette.primary,
                unselectedItemColor: ColorPalette.body,
                iconSize: 25,
                selectedFontSize: 14,
                unselectedFontSize: 14,
                backgroundColor: ColorPalette.white,
                currentIndex: controller.indexHalaman,
                onTap: (value) {
                  controller.indexHalaman = value;
                  controller.update();
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home_filled),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outlined),
                    activeIcon: Icon(Icons.person),
                    label: "Profile",
                  ),
                ],
              )
          );
        }
    );
  }
}
