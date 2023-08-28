import 'package:get/get.dart';
import 'package:nature_photos/models/upload_file_info.dart';

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
}
