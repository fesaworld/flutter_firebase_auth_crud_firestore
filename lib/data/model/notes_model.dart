import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Notes {
  String? id;
  String? uuid;
  String? title;
  String? body;

  Notes({
    this.id,
    this.uuid,
    this.title,
    this.body,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'uuid': uuid,
  //     'title': title,
  //     'body': body,
  //   };
  // }
  //
  // factory Notes.fromMap(Map<String, dynamic> map) {
  //   return Notes(
  //     id: map['id'] != null ? map['id'] as String : null,
  //     uuid: map['uuid'] != null ? map['uuid'] as String : null,
  //     title: map['title'] != null ? map['title'] as String : null,
  //     body: map['body'] != null ? map['body'] as String : null,
  //   );
  // }

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  Notes.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) 
  : id = doc.data()?['id'],
    uuid = doc.data()?['uuid'],
    title = doc.data()?['title'],
    body =  doc.data()?['body'];
}
