import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  Future<void> uploadFile(File file, String key) async {
    final ref = FirebaseStorage.instance.ref();

    final filesRefPath = ref.child(key);
    try {
      await filesRefPath.putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<void> uploadData(Uint8List data, String key) async {
    final ref = FirebaseStorage.instance.ref();

    final filesRefPath = ref.child(key);
    try {
      await filesRefPath.putData(data);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> getThumbnailUrl(String fileName) async {
    final storageRef =
        FirebaseStorage.instanceFor(bucket: "gs://flutter-nature-photos-resize")
            .ref();
    final downloadUrl =
        await storageRef.child("thumbnail/$fileName").getDownloadURL();
    return downloadUrl;
  }
}
