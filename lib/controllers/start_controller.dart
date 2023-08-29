import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nature_photos/bindings/map_bindig.dart';
import 'package:nature_photos/models/upload_file_info.dart';
import 'package:nature_photos/screens/map_screen.dart';

import '../repositories/database_repository.dart';

class StartController extends GetxController {
  final initializing = true.obs;
  final databaseRepository = Get.find<DatabaseRepository>();

  final uploadFileInfo = <UploadFileInfo>[].obs;
  @override
  void onInit() async {
    super.onInit();
    uploadFileInfo.value = await databaseRepository.getUploadFileInfo();
    initializing.value = false;
  }

  void showMap(UploadFileInfo uploadFileInfo) {
    final exif = uploadFileInfo.exifData;
    if (exif.latitude == null || exif.longitude == null) return;
    Get.to(() => MapScreen(location: LatLng(exif.latitude!, exif.longitude!)),
        binding: MapBinding());
  }
}
