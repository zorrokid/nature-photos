import 'exif_data.dart';

class UploadFileInfo {
  UploadFileInfo({
    required this.originalFileName,
    required this.extension,
    required this.exifData,
  });
  final String originalFileName;
  final String extension;
  final ExifMetaData exifData;

  Map<String, dynamic> toJson() => {
        'originalFileName': originalFileName,
        'extension': extension,
        'exifData': exifData.toJson(),
      };
  static UploadFileInfo fromJson(Map<String, dynamic> json) => UploadFileInfo(
        originalFileName: json['originalFileName'] as String,
        extension:
            json.containsKey('extension') ? json['extension'] as String : '',
        exifData:
            ExifMetaData.fromJson(json['exifData'] as Map<String, dynamic>),
      );
}
