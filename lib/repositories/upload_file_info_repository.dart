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

  void setLabelsCallback(
      Function(List<ImageLabel>) callback, FileInfo fileInfo) {
    FirebaseFirestore.instance
        .collection(imageInfoCollection)
        .doc(fileInfo.id)
        .collection("labels")
        .snapshots()
        .listen((event) {
      final labels =
          event.docs.map((doc) => ImageLabel.fromJson(doc.data())).toList();
      callback(labels);
    });
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
      finfo.labels.addAll(labels);
      fileInfo.add(finfo);
    }
    return fileInfo;
  }

  Future<void> updateSelected(
      FileInfo fileInfo, ImageLabel label, bool selected) async {
    await FirebaseFirestore.instance
        .collection(imageInfoCollection)
        .doc(fileInfo.id)
        .collection("labels")
        .doc(label.value)
        .update({"selected": selected});
  }

  Future<void> addLabel(FileInfo fileInfo, String label) async {
    await FirebaseFirestore.instance
        .collection(imageInfoCollection)
        .doc(fileInfo.id)
        .collection("labels")
        .doc(label)
        .set({
      "value": label,
      "selected": true,
      "isManuallyAdded": true,
      "score": 1.0,
      "topicality": 1.0
    });
  }
}
