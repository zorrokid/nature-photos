import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/models/file_info.dart';
import 'package:nature_photos/widgets/image_container.dart';
import 'package:nature_photos/widgets/image_labels.dart';

class ViewPhotoScreen extends GetView<ViewPhotoController> {
  const ViewPhotoScreen({super.key, required this.fileInfo});
  final FileInfo fileInfo;

  @override
  Widget build(BuildContext context) {
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
            ImageLabels(labels: fileInfo.labels),
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
