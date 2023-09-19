import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nature_photos/models/image_label.dart';

import '../models/file_info.dart';
import '../models/upload_file_info.dart';

const String imageInfoCollection = "imageInfo";

class UploadFileInfoRepository {
  Future<String?> saveData(UploadFileInfo uploadFileInfo) async {
    final database = FirebaseFirestore.instance;
    final ref = await database
        .collection(imageInfoCollection)
        .add(uploadFileInfo.toJson());
    return ref.id;
  }

  /*void getFileInfoUpdates(Function(List<FileInfo>) callback) {
    final database = FirebaseFirestore.instance;
    database.collection(uploadFileInfoCollection).snapshots().listen((event) {
      final uploadFileInfo = event.docs
          .map((doc) => FileInfo.fromJson(doc.data(), doc.id))
          .toList();
      callback(uploadFileInfo);
    });
  }*/

  Future<List<FileInfo>> getFileInfo() async {
    final database = FirebaseFirestore.instance;
    final snapshot = await database.collection(imageInfoCollection).get();
    final fileInfo = <FileInfo>[];
    for (final doc in snapshot.docs) {
      final finfo = FileInfo.fromJson(doc.data(), doc.id);
      // get collection of labels from imageInfo
      final labelsSnapshot = await doc.reference.collection("labels").get();
      final labels = labelsSnapshot.docs
          .map((doc) => ImageLabel.fromJson(doc.data()))
          .toList();
      finfo.labels.addAll(Map.fromIterable(labels, key: (e) => e.value));
      fileInfo.add(finfo);
    }
    return fileInfo;
  }

  Future<void> updateSelected(
      FileInfo fileInfo, ImageLabel label, bool selected) async {
    final database = FirebaseFirestore.instance;

    var ref = database
        .collection(imageInfoCollection)
        .doc(fileInfo.id)
        .collection("labels")
        .doc(label.value);

    await ref.update({"selected": selected});
  }
}
