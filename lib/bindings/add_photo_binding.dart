import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_photos/controllers/add_photo_controller.dart';
import 'package:nature_photos/repositories/upload_file_info_repository.dart';

import '../repositories/storage_repository.dart';

class AddPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPhotoController>(() => AddPhotoController());
    Get.lazyPut<UploadFileInfoRepository>(() => UploadFileInfoRepository());
    Get.lazyPut<StorageRepository>(() => StorageRepository());
    Get.lazyPut<ImagePicker>(() => ImagePicker());
  }
}
