import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_crud_firestore/const/text_style.dart';
import 'package:flutter_firebase_auth_crud_firestore/screen/mainpage/mainpage_controller.dart';
import 'package:get/get.dart';

import '../../widget/card/note_card_widget.dart';

class MainpageView extends StatelessWidget {
  const MainpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference notes = firestore.collection('notes');

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
            body: RefreshIndicator(
              onRefresh: () async {
                controller.noteList = [];
                controller.onInit();
              },
              child: SafeArea(
                child: Container(
                    height: Get.height,
                    width: Get.width,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      child: Column(children: [
                        // FutureBuilder<QuerySnapshot>(
                        //   future: notes.get(),
                        //   builder: (_, snapshot){
                        //     if(snapshot.hasData){
                        //       return Column(
                        //         children: snapshot.data!.docs.map((e) => NotesCardWidget(
                        //           onTap: (){
                        //
                        //           },
                        //           titleNote: (e.data() as dynamic)['title'].toString(),
                        //           subTitleNote: (e.data() as dynamic)['body'].toString(),
                        //         )).toList(),
                        //       );
                        //     }else{
                        //       return Text('Loading');
                        //     }
                        //   }
                        // ),

                        // StreamBuilder<QuerySnapshot>(
                        //     stream: notes.snapshots(),
                        //     builder: (_, snapshot) {
                        //       if (snapshot.hasData) {
                        //         return Column(
                        //           children: snapshot.data!.docs
                        //               .map((e) => NotesCardWidget(
                        //                     onTap: () {},
                        //                     titleNote:
                        //                         (e.data() as dynamic)['title']
                        //                             .toString(),
                        //                     subTitleNote:
                        //                         (e.data() as dynamic)['body']
                        //                             .toString(),
                        //                   ))
                        //               .toList(),
                        //         );
                        //       } else {
                        //         return Text('Loading');
                        //       }
                        //     }),

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

                        controller.isLoading
                            ? Center(
                                child: Column(
                                  children: const [
                                    SizedBox(height: 20),
                                    CircularProgressIndicator.adaptive(),
                                    SizedBox(height: 10),
                                    Text('Loading')
                                  ],
                                ),
                              )
                            :controller.noteList.length > 0
                                  ? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: controller.noteList?.length,
                                      itemBuilder: (context, index) {
                                        return NotesCardWidget(
                                            onTap: () {
                                            },
                                            titleNote: (controller.noteList as dynamic)[index].title,
                                            subTitleNote: (controller.noteList as dynamic)[index].body,
                                        );
                                      })
                                  :  const Center(
                                      child: Text('Data not found'),
                                    )
                      ]),
                    )),
              ),
            ),
          );
        });
  }
}
