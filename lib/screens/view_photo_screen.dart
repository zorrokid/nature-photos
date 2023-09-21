import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/widgets/image_container.dart';
import 'package:nature_photos/widgets/image_labels.dart';

class ViewPhotoScreen extends GetView<ViewPhotoController> {
  const ViewPhotoScreen({super.key});

  void showAddLabelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller.labelTextEditController,
              decoration: const InputDecoration(
                labelText: 'Label',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.addLabel();
                Get.back();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View photo'),
      ),
      body: Center(
        child: controller.fileInfo.value != null
            ? Obx(
                () => Column(
                  children: [
                    ImageContainer(
                      fileInfo: controller.fileInfo.value!,
                      downloadUrlProvider: controller.getDownloadUrl,
                    ),
                    ImageLabels(
                      labels: controller.fileInfo.value!.labels,
                      labelSelectionCallback: controller.setLabelSelection,
                    ),
                    ElevatedButton(
                      onPressed: () => showAddLabelBottomSheet(context),
                      child: const Text('Add label'),
                    ),
                    controller.fileInfo.value!.hasLocation
                        ? TextButton(
                            onPressed: () =>
                                controller.showMap(controller.fileInfo.value!),
                            child: const Text('Show map'),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
