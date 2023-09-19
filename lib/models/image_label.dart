class ImageLabel {
  ImageLabel({
    required this.value,
    required this.score,
    required this.topicality,
    required this.selected,
  });

  final String value;
  final double score;
  final double topicality;
  final bool selected;

  static ImageLabel fromJson(Map<String, dynamic> json) => ImageLabel(
        value: json['value'] as String,
        score: json['score'] as double,
        selected: json['selected'] as bool,
        topicality: json['topicality'] as double,
      );

  ImageLabel copyWith({
    String? value,
    double? score,
    double? topicality,
    bool? selected,
  }) {
    return ImageLabel(
      value: value ?? this.value,
      score: score ?? this.score,
      topicality: topicality ?? this.topicality,
      selected: selected ?? this.selected,
    );
  }
}
