import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Notes {
  String? uuid;
  String? title;
  String? body;

  Notes({
    this.uuid,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'title': title,
      'body': body,
    };
  }

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  Notes.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) 
  : uuid = (doc.data() as dynamic)['uuid'],
    title = (doc.data() as dynamic)['title'],
    body =  (doc.data() as dynamic)['body'];

  String toJson() => json.encode(toMap());

  factory Notes.fromJson(String source) => Notes.fromMap(json.decode(source) as Map<String, dynamic>);
}
