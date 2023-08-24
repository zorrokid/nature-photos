import 'package:nature_photos/controllers/add_photo_controller.dart';

class UploadFileInfo {
  UploadFileInfo({
    required this.fileName,
    required this.exifData,
  });
  final String fileName;
  final ExifData exifData;

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'exifData': exifData.toJson(),
      };
}
