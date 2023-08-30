import 'exif_data.dart';

class UploadFileInfo {
  UploadFileInfo({
    required this.fileName,
    required this.extension,
    required this.exifData,
  });
  final String fileName;
  final String extension;
  final ExifMetaData exifData;

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'extension': extension,
        'exifData': exifData.toJson(),
      };
  static UploadFileInfo fromJson(Map<String, dynamic> json) => UploadFileInfo(
        fileName: json['fileName'] as String,
        extension:
            json.containsKey('extension') ? json['extension'] as String : '',
        exifData:
            ExifMetaData.fromJson(json['exifData'] as Map<String, dynamic>),
      );
}
