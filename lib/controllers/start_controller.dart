import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nature_photos/bindings/map_bindig.dart';
import 'package:nature_photos/models/upload_file_info.dart';
import 'package:nature_photos/screens/map_screen.dart';

import '../repositories/upload_file_info_repository.dart';

class StartController extends GetxController {
  final initializing = true.obs;
  final databaseRepository = Get.find<UploadFileInfoRepository>();

  final uploadFileInfo = <UploadFileInfo>[].obs;
  @override
  void onInit() async {
    super.onInit();
    databaseRepository.getUploadFileInfoUpdates(setUploadFileInfo);
    initializing.value = false;
  }

  void setUploadFileInfo(List<UploadFileInfo> uploadFileInfo) {
    this.uploadFileInfo.value = uploadFileInfo;
  }

  void showMap(UploadFileInfo uploadFileInfo) {
    final exif = uploadFileInfo.exifData;
    if (exif.latitude == null || exif.longitude == null) return;
    Get.to(() => MapScreen(location: LatLng(exif.latitude!, exif.longitude!)),
        binding: MapBinding());
  }
}
