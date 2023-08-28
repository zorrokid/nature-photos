import 'package:flutter/material.dart';

import '../models/upload_file_info.dart';

class UploadFileInfoList extends StatelessWidget {
  const UploadFileInfoList({super.key, required this.uploadFileInfoList});
  final List<UploadFileInfo> uploadFileInfoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: uploadFileInfoList.length,
      itemBuilder: (context, index) {
        final uploadFileInfo = uploadFileInfoList[index];
        return ListTile(
          title: Text(uploadFileInfo.fileName),
          subtitle: Text(uploadFileInfo.exifData.toString()),
        );
      },
    );
  }
}
