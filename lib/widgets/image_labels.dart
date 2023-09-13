import 'package:flutter/material.dart';

class ImageLabels extends StatelessWidget {
  const ImageLabels({super.key, required this.labels});
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: labels
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Chip(
                label: Text(e),
              ),
            ),
          )
          .toList(),
    );
  }
}
