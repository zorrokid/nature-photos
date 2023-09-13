import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/view_photo_binding.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/screens/view_photo_screen.dart';
import '../models/file_info.dart';
import '../repositories/upload_file_info_repository.dart';

class StartController extends GetxController {
  final initializing = true.obs;
  final databaseRepository = Get.find<UploadFileInfoRepository>();
  final storageRepository = Get.find<StorageRepository>();

  final fileInfo = <FileInfo>[].obs;
  @override
  void onInit() async {
    super.onInit();
    databaseRepository.getFileInfoUpdates(setUploadFileInfo);
    loadData().then((value) {
      fileInfo.addAll(value);
      fileInfo.refresh();
      initializing.value = false;
    });
  }

  void setUploadFileInfo(List<FileInfo> fileInfo) {
    this.fileInfo.value = fileInfo;
  }

  void viewPhoto(FileInfo fileInfo) {
    Get.to(
      () => ViewPhotoScreen(fileInfo: fileInfo),
      binding: ViewPhotoBinding(),
    );
  }

  Future<List<FileInfo>> loadData() async {
    return await databaseRepository.getFileInfo();
  }

  Future<String?> getDownloadUrl(FileInfo fileInfo) async {
    if (!fileInfo.thumbnail) return null;
    try {
      final url = await storageRepository.getThumbnailUrl(fileInfo.fileName);
      return url;
    } catch (e) {
      debugPrint("Failed to get download url");
      return null;
    }
  }
}
