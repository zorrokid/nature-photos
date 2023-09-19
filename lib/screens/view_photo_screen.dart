import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/models/file_info.dart';
import 'package:nature_photos/widgets/image_container.dart';
import 'package:nature_photos/widgets/image_labels.dart';

class ViewPhotoScreen extends GetView<ViewPhotoController> {
  const ViewPhotoScreen({super.key, required this.fileInfo});
  final FileInfo fileInfo;

  @override
  Widget build(BuildContext context) {
    controller.setFileInfo(fileInfo);
    return Scaffold(
      appBar: AppBar(
        title: const Text('View photo'),
      ),
      body: Center(
        child: Column(
          children: [
            ImageContainer(
              fileInfo: fileInfo,
              downloadUrlProvider: controller.getDownloadUrl,
            ),
            Obx(() => controller.fileInfo.value != null
                ? ImageLabels(
                    labels: controller.fileInfo.value!.labels.values.toList(),
                    labelSelectionCallback: controller.setLabelSelection,
                  )
                : const SizedBox()),
            fileInfo.exifData.latitude != null &&
                    fileInfo.exifData.longitude != null
                ? TextButton(
                    onPressed: () => controller.showMap(fileInfo),
                    child: const Text('Show map'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
