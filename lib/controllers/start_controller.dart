import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/view_photo_binding.dart';
import 'package:nature_photos/controllers/user_controller.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/screens/view_photo_screen.dart';
import '../models/file_info.dart';
import '../repositories/upload_file_info_repository.dart';

class StartController extends GetxController {
  final initializing = true.obs;
  final imageInfoRepository = Get.find<UploadFileInfoRepository>();
  final storageRepository = Get.find<StorageRepository>();
  final viewPhotoController = Get.find<ViewPhotoController>();
  final userController = Get.find<UserController>();

  final fileInfo = <FileInfo>[].obs;

  @override
  void onInit() async {
    super.onInit();
    //databaseRepository.getFileInfoUpdates(setUploadFileInfo);
    loadData().then((value) {
      debugPrint("Initial data loaded");
      fileInfo.addAll(value);
      fileInfo.refresh();
      initializing.value = false;
    });
  }

  /*void setUploadFileInfo(List<FileInfo> fileInfo) {
    debugPrint("Update received");
    for (final info in fileInfo) {
      final localInfo =
          this.fileInfo.firstWhereOrNull((element) => element.id == info.id);
      if (localInfo == null) {
        debugPrint("Adding new file info");
        this.fileInfo.add(info);
      } else {
        debugPrint("Updating file info");
        final index = this.fileInfo.indexOf(localInfo);
        this.fileInfo[index] = info;
      }
    }
    this.fileInfo.refresh();
  }*/

  void viewPhoto(FileInfo fileInfo) {
    viewPhotoController.setFileInfo(fileInfo);
    Get.to(
      () => const ViewPhotoScreen(),
      binding: ViewPhotoBinding(),
    );
  }

  Future<List<FileInfo>> loadData() async {
    return await imageInfoRepository
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
}
