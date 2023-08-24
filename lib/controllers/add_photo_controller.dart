import 'dart:io';

import 'package:exif/exif.dart';
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

    final exif = await _readExif();

    final exifData = parseExif(exif);

    final uploadFileInfo = UploadFileInfo(
      fileName: basename(imageFile.value!.path),
      exifData: exifData,
    );
    final id = await databaseRepository.saveData(uploadFileInfo);
    if (id == null) return; // TODO: handle error
    await storageRepository.uploadFile('images', imageFile.value!, id);
    Get.snackbar("Upload", "File uploaded");
    Get.to(() => const StartScreen());
  }

  Future<Map<String, dynamic>> _readExif() async {
    final fileBytes = imageFile.value!.readAsBytesSync();
    final exifData = await readExifFromBytes(fileBytes);
    return exifData;
  }

  ExifData parseExif(Map<String, dynamic> exifData) {
    return ExifData();
  }
}

class ExifData {
  Map<String, dynamic> toJson() => {};
}
