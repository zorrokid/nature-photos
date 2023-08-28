import 'package:get/get.dart';
import 'package:nature_photos/controllers/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
