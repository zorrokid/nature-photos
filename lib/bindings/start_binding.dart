import 'package:get/get.dart';
import 'package:nature_photos/controllers/logout_controller.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';
import 'package:nature_photos/repositories/storage_repository.dart';

import '../controllers/start_controller.dart';
import '../repositories/upload_file_info_repository.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogOutController>(() => LogOutController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<StartController>(() => StartController());
    Get.lazyPut<UploadFileInfoRepository>(() => UploadFileInfoRepository());
    Get.lazyPut<StorageRepository>(() => StorageRepository());
    Get.lazyPut<ViewPhotoController>(() => ViewPhotoController());
  }
}
