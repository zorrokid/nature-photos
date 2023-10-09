import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nature_photos/controllers/view_photo_controller.dart';
import 'package:nature_photos/widgets/image_container.dart';
import 'package:nature_photos/widgets/image_labels.dart';

class ViewPhotoScreen extends StatefulWidget {
  ViewPhotoScreen({super.key});
  final controller = Get.find<ViewPhotoController>();

  @override
  State<StatefulWidget> createState() {
    return _ViewPhotoScreenState();
  }
}

class _ViewPhotoScreenState extends State<ViewPhotoScreen> {
  @override
  void dispose() {
    super.dispose();
    widget.controller.unsubscribe();
  }

  void showAddLabelBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: widget.controller.labelTextEditController,
              decoration: const InputDecoration(
                labelText: 'Label',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                widget.controller.addLabel();
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
        child: widget.controller.fileInfo.value != null
            ? Obx(
                () => Column(
                  children: [
                    ImageContainer(
                      fileInfo: widget.controller.fileInfo.value!,
                      downloadUrlProvider: widget.controller.getDownloadUrl,
                    ),
                    ImageLabels(
                      labels: widget.controller.fileInfo.value!.labels,
                      labelSelectionCallback:
                          widget.controller.setLabelSelection,
                    ),
                    ElevatedButton(
                      onPressed: () => showAddLabelBottomSheet(context),
                      child: const Text('Add label'),
                    ),
                    widget.controller.fileInfo.value!.hasLocation
                        ? TextButton(
                            onPressed: () => widget.controller
                                .showMap(widget.controller.fileInfo.value!),
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
