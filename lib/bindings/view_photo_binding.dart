import 'package:get/get.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/repositories/storage_repository.dart';

class ViewPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewPhotoController>(() => ViewPhotoController(), fenix: true);
    Get.lazyPut<StorageRepository>(() => StorageRepository(), fenix: true);
  }
}
