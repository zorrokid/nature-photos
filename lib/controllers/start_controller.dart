import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nature_photos/bindings/map_bindig.dart';
import 'package:nature_photos/models/upload_file_info.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:nature_photos/screens/map_screen.dart';
import '../models/file_info.dart';
import '../repositories/upload_file_info_repository.dart';

class StartController extends GetxController {
  final initializing = true.obs;
  final databaseRepository = Get.find<UploadFileInfoRepository>();
  final storageRepository = Get.find<StorageRepository>();

  final fileInfo = <FileInfo>[].obs;
  @override
  void onInit() async {
    super.onInit();
    databaseRepository.getFileInfoUpdates(setUploadFileInfo);
    initializing.value = false;
    loadData().then((value) {
      fileInfo.value = value;
      initializing.value = false;
    });
  }

  void setUploadFileInfo(List<FileInfo> fileInfo) {
    this.fileInfo.value = fileInfo;
  }

  void showMap(UploadFileInfo uploadFileInfo) {
    final exif = uploadFileInfo.exifData;
    if (exif.latitude == null || exif.longitude == null) return;
    Get.to(() => MapScreen(location: LatLng(exif.latitude!, exif.longitude!)),
        binding: MapBinding());
  }

  Future<List<FileInfo>> loadData() async {
    return await databaseRepository.getFileInfo();
  }

  Future<String?> getDownloadUrl(FileInfo fileInfo) async {
    if (!fileInfo.thumbnail) return null;
    final url = await storageRepository.getThumbnailUrl(fileInfo.fileName);
    return url;
  }
}
