import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nature_photos/bindings/map_bindig.dart';
import 'package:nature_photos/models/file_info.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/screens/map_screen.dart';

class ViewPhotoController extends GetxController {
  final storageRepository = Get.find<StorageRepository>();
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
}
