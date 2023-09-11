import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/file_info.dart';

typedef ShowCallback = void Function(FileInfo uploadFileInfo);
typedef DownloadUrlProvider = Future<String?> Function(FileInfo uploadFileInfo);

class UploadFileInfoList extends StatelessWidget {
  const UploadFileInfoList({
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
          leading: Thumbnail(
              fileInfo: fileInfo, downloadUrlProvider: downloadUrlProvider),
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

class Thumbnail extends StatefulWidget {
  const Thumbnail({
    super.key,
    required this.fileInfo,
    required this.downloadUrlProvider,
  });
  final FileInfo fileInfo;
  final DownloadUrlProvider downloadUrlProvider;

  @override
  State<StatefulWidget> createState() {
    return _ThumbnailState();
  }
}

class _ThumbnailState extends State<Thumbnail> {
  String? downloadUrl;
  @override
  void initState() {
    super.initState();
    widget.downloadUrlProvider(widget.fileInfo).then((value) => setState(() {
          downloadUrl = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return downloadUrl != null
        ? CachedNetworkImage(
            imageUrl: downloadUrl!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : const Icon(Icons.image);
  }
}
