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
}
