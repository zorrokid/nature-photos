import 'package:flutter/material.dart';
import 'package:nature_photos/models/image_label.dart';

typedef LabelSelectionCallback = void Function(ImageLabel label, bool selected);

class ImageLabels extends StatelessWidget {
  const ImageLabels({
    super.key,
    required this.labels,
    required this.labelSelectionCallback,
  });
  final List<ImageLabel> labels;
  final LabelSelectionCallback labelSelectionCallback;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: labels
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: FilterChip(
                label: Text(e.value),
                onSelected: (bool selected) =>
                    labelSelectionCallback(e, selected),
                selected: e.selected,
              ),
            ),
          )
          .toList(),
    );
  }
}
