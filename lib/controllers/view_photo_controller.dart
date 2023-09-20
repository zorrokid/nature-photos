import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nature_photos/bindings/map_bindig.dart';
import 'package:nature_photos/models/file_info.dart';
import 'package:nature_photos/models/image_label.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/repositories/upload_file_info_repository.dart';
import 'package:nature_photos/screens/map_screen.dart';

class ViewPhotoController extends GetxController {
  final storageRepository = Get.find<StorageRepository>();
  final imageInfoRepository = Get.find<UploadFileInfoRepository>();
  final fileInfo = Rxn<FileInfo>();

  void setLabels(List<ImageLabel> labels) {
    if (fileInfo.value == null) return;
    final finfo = fileInfo.value!.copyWith(labels: labels);
    fileInfo.value = finfo;
    fileInfo.refresh();
  }

  void setFileInfo(FileInfo finfo) {
    fileInfo.value = finfo;
    fileInfo.refresh();
    imageInfoRepository.setLabelsCallback(setLabels, finfo);
  }

  void showMap(FileInfo fileInfo) {
    final exif = fileInfo.exifData;
    if (exif.latitude == null || exif.longitude == null) return;
    Get.to(() => MapScreen(location: LatLng(exif.latitude!, exif.longitude!)),
        binding: MapBinding());
  }

  Future<String?> getDownloadUrl(FileInfo fileInfo) async {
    if (!fileInfo.thumbnail) return null;
    try {
      final url = await storageRepository.getThumbnailUrl(fileInfo.fileName);
      return url;
    } catch (e) {
      debugPrint("Failed to get download url");
      return null;
    }
  }

  void setLabelSelection(ImageLabel label, bool selected) {
    if (fileInfo.value == null) return;
    imageInfoRepository.updateSelected(fileInfo.value!, label, selected);
  }
}
