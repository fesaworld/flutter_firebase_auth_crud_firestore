import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/const/color_pallete.dart';
import 'package:get/get.dart';

import '../../const/text_style.dart';

class UpdateDialogWidget extends StatelessWidget {
  final bool isUpdate;
  final String titleNote;
  final String subTitleNote;
  // final VoidCallback? onDeleted;
  // final VoidCallback? onSave;
  UpdateDialogWidget({Key? key, required this.isUpdate, required this.titleNote, required this.subTitleNote}) : super(key: key);

  TextEditingController noteTitleController = TextEditingController();
  TextEditingController noteBodyController = TextEditingController();
  FocusNode noteTitleFocus = FocusNode();
  FocusNode noteBodyFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    noteTitleController.text = titleNote;
    noteBodyController.text = subTitleNote;


    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
        noteTitleFocus.unfocus();
        noteBodyFocus.unfocus();
      },
      child: AlertDialog(
        backgroundColor: Colors.orange.shade50,
        title: Container(
            height: Get.height * 0.1,
            child: TextField(
              style: title,
              focusNode: noteTitleFocus,
              expands: true,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: noteTitleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(8)),
                hintText: 'Insert title here'
              ),
            )
        ),
        content: Container(
          height: Get.height * 0.3,
          child: TextField(
            style: subTitle,
            focusNode: noteBodyFocus,
            expands: true,
            textAlign: TextAlign.start,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: noteBodyController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Insert notes here'
            ),
          )
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
                            ColorPalette.danger)),
                    onPressed: () async {
                      if (isUpdate){
                        bool result = await Get.dialog(
                            barrierDismissible: false,
                            WarningDialogWidget()
                        );

                        if (result){
                          Get.back(result : [result]);
                        }
                      }else{
                        Get.back(result: []);
                      }
                    },
                    child: isUpdate ? const Text("Hapus") : const Text("Batal")),
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
                      Get.back(result: [noteTitleController.text, noteBodyController.text]);
                    },
                    child: const Text("Simpan", style: TextStyle(color: ColorPalette.white),)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WarningDialogWidget extends StatelessWidget {
  const WarningDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning',style: title),
      content: Text('Apakah yakin anda menghapus data ?', style: subTitle.copyWith(fontSize: 16)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ColorPalette.danger)),
                  onPressed: (){
                    Get.back(result: true);
                  },
                  child: const Text("Hapus")),
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
                    Get.back(result: false);
                  },
                  child: const Text("Batal")),
            ),
          ],
        ),
      ],
    );
  }
}



