import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nature_photos/models/file_info.dart';
import 'package:nature_photos/widgets/file_list.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({
    super.key,
    required this.fileInfo,
    required this.downloadUrlProvider,
  });
  final FileInfo fileInfo;
  final DownloadUrlProvider downloadUrlProvider;

  @override
  State<StatefulWidget> createState() {
    return _ImageContainerState();
  }
}

class _ImageContainerState extends State<ImageContainer> {
  String? downloadUrl;
  @override
  void initState() {
    super.initState();
    widget.downloadUrlProvider(widget.fileInfo).then((value) {
      if (mounted) {
        setState(() {
          downloadUrl = value;
        });
      }
    });
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
