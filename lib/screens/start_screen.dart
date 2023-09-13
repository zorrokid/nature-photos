import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/bindings/add_photo_binding.dart';

import '../controllers/start_controller.dart';
import '../widgets/file_list.dart';
import 'add_photo_screen.dart';
import '../widgets/default_drawer.dart';

class StartScreen extends GetView<StartController> {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Nature photos'),
      ),
      drawer: const DefaultDrawer(),
      body: Center(
        child: Obx(
          () => controller.initializing.value == true
              ? const CircularProgressIndicator()
              : FileList(
                  uploadFileInfoList: controller.fileInfo,
                  onShow: (uploadFileInfo) {
                    controller.viewPhoto(uploadFileInfo);
                  },
                  downloadUrlProvider: controller.getDownloadUrl,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => const AddPhotoScreen(),
          binding: AddPhotoBinding(),
        ),
        tooltip: 'Add photo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
