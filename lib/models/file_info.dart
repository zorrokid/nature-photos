import 'package:nature_photos/models/image_label.dart';

import 'exif_data.dart';
import 'upload_file_info.dart';

class FileInfo extends UploadFileInfo {
  FileInfo({
    required super.originalFileName,
    required super.extension,
    required super.exifData,
    required super.userId,
    required this.id,
    required this.labels,
    required this.resized,
    required this.thumbnail,
  });

  final String id;
  final List<ImageLabel> labels;
  final bool resized;
  final bool thumbnail;

  String get fileName => id + extension;

  bool get hasLocation =>
      exifData.latitude != null && exifData.longitude != null;

  static FileInfo fromJson(Map<String, dynamic> json, String id) => FileInfo(
        id: id,
        originalFileName: json.containsKey('originalFileName')
            ? json['originalFileName'] as String
            : '',
        extension:
            json.containsKey('extension') ? json['extension'] as String : '',
        exifData:
            ExifMetaData.fromJson(json['exifData'] as Map<String, dynamic>),
        userId: json.containsKey('userId') ? json['userId'] as String : '',
        labels: json.containsKey('labels')
            ? (json['labels'] as Map<String, dynamic>)
                .map((key, value) => MapEntry(key, ImageLabel.fromJson(value)))
                .values
                .toList()
            : <ImageLabel>[],
        resized: json['resized'] as bool? ?? false,
        thumbnail: json['thumbnail'] as bool? ?? false,
      );

  FileInfo copyWith({
    String? id,
    String? originalFileName,
    String? extension,
    ExifMetaData? exifData,
    String? userId,
    List<ImageLabel>? labels,
    bool? resized,
    bool? thumbnail,
  }) {
    return FileInfo(
      id: id ?? this.id,
      originalFileName: originalFileName ?? this.originalFileName,
      extension: extension ?? this.extension,
      exifData: exifData ?? this.exifData,
      userId: userId ?? this.userId,
      labels: labels ?? this.labels,
      resized: resized ?? this.resized,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
