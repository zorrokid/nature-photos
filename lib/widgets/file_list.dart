import 'package:flutter/material.dart';
import 'package:nature_photos/widgets/image_container.dart';

import '../models/file_info.dart';

typedef ShowCallback = void Function(FileInfo uploadFileInfo);
typedef DownloadUrlProvider = Future<String?> Function(FileInfo uploadFileInfo);

class FileList extends StatelessWidget {
  const FileList({
    super.key,
    required this.uploadFileInfoList,
    required this.onShow,
    required this.downloadUrlProvider,
  });
  final List<FileInfo> uploadFileInfoList;
  final ShowCallback onShow;
  final DownloadUrlProvider downloadUrlProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: uploadFileInfoList.length,
      itemBuilder: (context, index) {
        final fileInfo = uploadFileInfoList[index];
        return ListTile(
          leading: GestureDetector(
            child: ImageContainer(
              fileInfo: fileInfo,
              downloadUrlProvider: downloadUrlProvider,
            ),
            onTap: () => onShow(fileInfo),
          ),
          title: Text(fileInfo.originalFileName),
          subtitle: Text(fileInfo.exifData.toString()),
          trailing: TextButton(
            child: const Text("Show"),
            onPressed: () => onShow(fileInfo),
          ),
        );
      },
    );
  }
}
