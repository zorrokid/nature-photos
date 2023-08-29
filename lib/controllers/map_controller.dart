import 'package:get/get.dart';
import 'package:nature_photos/models/upload_file_info.dart';

class MapController extends GetxController {
  final longitude = 0.0.obs;
  final latitude = 0.0.obs;

  void setLocation(UploadFileInfo uploadFileInfo) {
    longitude.value = uploadFileInfo.exifData.longitude ?? 0.0;
    latitude.value = uploadFileInfo.exifData.latitude ?? 0.0;
  }
}
