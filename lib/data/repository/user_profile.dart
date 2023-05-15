import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser({
    required String uuid,
    required String username,
    required String email,
    required DateTime dob,
    required String profileImage,
    required String address,
    required DateTime timeStamp
  }) async {
    await userCollection.add({
      'uuid': uuid,
      'username': username,
      'email': email,
      'dob': dob,
      'profileImage': profileImage,
      'address': address,
      'timestamp': timeStamp
    });
  }

  Future<void> updateUser({
    required String id,
    required String uuid,
    required String username,
    required String email,
    required DateTime dob,
    required String profileImage,
    required String address,
    required DateTime timeStamp
  }) async {
    await userCollection.doc(id).update({
      'uuid': uuid,
      'username': username,
      'email': email,
      'dob': dob,
      'profileImage': profileImage,
      'address': address,
      'timestamp': timeStamp
    });
  }
}