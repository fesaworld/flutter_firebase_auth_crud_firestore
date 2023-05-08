import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/color_pallete.dart';
import '../../const/text_style.dart';

class NotesCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String titleNote;
  final String subTitleNote;
  const NotesCardWidget({Key? key, required this.onTap, required this.titleNote, required this.subTitleNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: Get.width,
      height: Get.height * 0.2,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        highlightColor: ColorPalette.primary,
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: ColorPalette.primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: ColorPalette.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        titleNote,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: title,
                      )),
                ),
                const SizedBox(height: 5,),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    height: 50,
                    child: Text(
                      subTitleNote,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: subTitle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
