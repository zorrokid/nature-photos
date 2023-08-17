import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/add_photo_controller.dart';

class AddPhotoScreen extends GetView<AddPhotoController> {
  const AddPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photo'),
      ),
      body: Column(
        children: [
          const Text('Add Photo'),
          SizedBox(
            width: 500,
            height: 500,
            child: Obx(() => controller.imageFile.value != null
                ? Image.file(controller.imageFile.value!, fit: BoxFit.cover)
                : const SizedBox.shrink()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await controller.pickImage(),
        child: const Icon(Icons.photo),
      ),
    );
  }
}
