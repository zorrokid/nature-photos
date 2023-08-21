import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_photos/models/upload_file_info.dart';
import 'package:nature_photos/repositories/database_repository.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:path/path.dart';

import '../screens/start_screen.dart';

class AddPhotoController extends GetxController {
  final storageRepository = Get.find<StorageRepository>();
  final databaseRepository = Get.find<DatabaseRepository>();
  final imagePicker = Get.find<ImagePicker>();
  final imageFile = Rx<File?>(null);

  Future<void> pickImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile.value = File(image.path);
    }
  }

  Future<void> uploadImage() async {
    if (imageFile.value == null) return;

    final uploadFileInfo = UploadFileInfo(
      fileName: basename(imageFile.value!.path),
    );
    final id = await databaseRepository.saveData(uploadFileInfo);
    if (id == null) return; // TODO: handle error
    await storageRepository.uploadFile('images', imageFile.value!, id);
    Get.snackbar("Upload", "File uploaded");
    Get.to(() => const StartScreen());
  }
}
