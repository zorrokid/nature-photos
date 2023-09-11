import 'exif_data.dart';
import 'upload_file_info.dart';

class FileInfo extends UploadFileInfo {
  FileInfo({
    required super.originalFileName,
    required super.extension,
    required super.exifData,
    required this.id,
    required this.labels,
    required this.resized,
    required this.thumbnail,
  });

  final String id;
  final List<String> labels;
  final bool resized;
  final bool thumbnail;

  String get fileName => id + extension;

  static FileInfo fromJson(Map<String, dynamic> json, String id) => FileInfo(
        id: id,
        originalFileName: json.containsKey('originalFileName')
            ? json['originalFileName'] as String
            : '',
        extension:
            json.containsKey('extension') ? json['extension'] as String : '',
        exifData:
            ExifMetaData.fromJson(json['exifData'] as Map<String, dynamic>),
        labels: json.containsKey('labels')
            ? (json['labels'] as List<dynamic>).map((e) => e as String).toList()
            : <String>[],
        resized: json['resized'] as bool? ?? false,
        thumbnail: json['thumbnail'] as bool? ?? false,
      );
}
