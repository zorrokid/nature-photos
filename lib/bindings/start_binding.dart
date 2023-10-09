import 'package:get/get.dart';
import 'package:nature_photos/controllers/app_controller.dart';
import 'package:nature_photos/controllers/user_controller.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/repositories/authentication_repository.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/repositories/upload_file_info_repository.dart';

class StartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadFileInfoRepository>(() => UploadFileInfoRepository());
    Get.lazyPut<StorageRepository>(() => StorageRepository());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository());
    Get.lazyPut<ViewPhotoController>(() => ViewPhotoController());
    Get.lazyPut<AppController>(() => AppController());
  }
}
