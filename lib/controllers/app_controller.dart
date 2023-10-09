import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/view_photo_binding.dart';
import 'package:nature_photos/controllers/user_controller.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/models/file_info.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/repositories/upload_file_info_repository.dart';
import 'package:nature_photos/screens/view_photo_screen.dart';

// main controller for the whole app
class AppController extends GetxController {
  final initializing = true.obs;
  final databaseRepository = Get.find<UploadFileInfoRepository>();
  final storageRepository = Get.find<StorageRepository>();
  final userController = Get.find<UserController>();
  final authenticationRepository = Get.find<AuthenticationRepository>();
  final viewPhotoController = Get.find<ViewPhotoController>();

  final fileInfo = <FileInfo>[].obs;

  @override
  void onInit() async {
    super.onInit();
    loadData().then((value) {
      fileInfo.addAll(value);
      fileInfo.refresh();
      initializing.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<FileInfo>> loadData() async {
    if (userController.firebaseUser.value == null) {
      return [];
    }
    return await databaseRepository
        .getFileInfo(userController.firebaseUser.value!.uid);
  }

  Future<void> fetch() async {
    initializing.value = true;
    final fileInfo = await loadData();
    this.fileInfo.clear();
    this.fileInfo.addAll(fileInfo);
    this.fileInfo.refresh();
    initializing.value = false;
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

  void viewPhoto(FileInfo fileInfo) {
    viewPhotoController.setFileInfo(fileInfo);
    Get.to(
      () => ViewPhotoScreen(),
      binding: ViewPhotoBinding(),
    );
  }
}
