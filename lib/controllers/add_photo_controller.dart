import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoController extends GetxController {
  AddPhotoController() {
    imagePicker = ImagePicker();
  }
  late final ImagePicker imagePicker;
  final imageFile = Rx<File?>(null);

  Future<void> pickImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile.value = File(image.path);
    }
  }
}
