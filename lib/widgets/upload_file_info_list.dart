import 'package:flutter/material.dart';

import '../models/upload_file_info.dart';

typedef ShowCallback = void Function(UploadFileInfo uploadFileInfo);

class UploadFileInfoList extends StatelessWidget {
  const UploadFileInfoList(
      {super.key, required this.uploadFileInfoList, required this.onShow});
  final List<UploadFileInfo> uploadFileInfoList;
  final ShowCallback onShow;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: uploadFileInfoList.length,
      itemBuilder: (context, index) {
        final uploadFileInfo = uploadFileInfoList[index];
        return ListTile(
          title: Text(uploadFileInfo.fileName),
          subtitle: Text(uploadFileInfo.exifData.toString()),
          trailing: TextButton(
            child: const Text("Show"),
            onPressed: () => onShow(uploadFileInfo),
          ),
        );
      },
    );
  }
}
