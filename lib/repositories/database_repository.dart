import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/upload_file_info.dart';

class DatabaseRepository {
  Future<String?> saveData(UploadFileInfo uploadFileInfo) async {
    final database = FirebaseFirestore.instance;
    final ref = await database
        .collection("uploadFileInfo")
        .add(uploadFileInfo.toJson());
    return ref.id;
  }

  Future<List<UploadFileInfo>> getUploadFileInfo() async {
    final database = FirebaseFirestore.instance;
    final snapshot = await database.collection("uploadFileInfo").get();
    final uploadFileInfo = snapshot.docs
        .map((doc) =>
            UploadFileInfo.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return uploadFileInfo;
  }
}
