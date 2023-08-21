class UploadFileInfo {
  UploadFileInfo({
    required this.fileName,
  });
  final String fileName;

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
      };
}
