import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/file_info.dart';
import '../models/upload_file_info.dart';

const String uploadFileInfoCollection = "uploadFileInfo";

class UploadFileInfoRepository {
  Future<String?> saveData(UploadFileInfo uploadFileInfo) async {
    final database = FirebaseFirestore.instance;
    final ref = await database
        .collection(uploadFileInfoCollection)
        .add(uploadFileInfo.toJson());
    return ref.id;
  }

  void getFileInfoUpdates(Function(List<FileInfo>) callback) {
    final database = FirebaseFirestore.instance;
    database
        .collection(uploadFileInfoCollection)
        .snapshots()
        .listen((snapshot) {
      final uploadFileInfo = snapshot.docs
          .map((doc) => FileInfo.fromJson(doc.data(), doc.id))
          .toList();
      callback(uploadFileInfo);
    });
  }

  Future<List<FileInfo>> getFileInfo() async {
    final database = FirebaseFirestore.instance;
    final snapshot = await database.collection(uploadFileInfoCollection).get();
    final uploadFileInfo = snapshot.docs
        .map((doc) => FileInfo.fromJson(doc.data(), doc.id))
        .toList();
    return uploadFileInfo;
  }
}
