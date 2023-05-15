import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage{

  final storage = const FlutterSecureStorage();

  Future<void> saveUid(String uid) async {
    await storage.write(key: 'uid', value: uid);
  }

  Future<void> deleteUid() async {
    await storage.delete(key: 'uid');
  }

  Future<String?> readUid() async {
    var uid = await storage.read(key: 'uid');
    return uid;
  }
}