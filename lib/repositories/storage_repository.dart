import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  Future<void> uploadFile(String path, File file, String key) async {
    final ref = FirebaseStorage.instance.ref(); // .child(path);

    final filesRefPath = ref.child('$path/$key');
    try {
      await filesRefPath.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
