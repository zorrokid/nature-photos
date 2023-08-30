class ExifMetaData {
  ExifMetaData({
    this.latitude,
    this.longitude,
  });
  double? latitude;
  double? longitude;
  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };

  static ExifMetaData fromJson(Map<String, dynamic> json) => ExifMetaData()
    ..latitude = json["latitude"] as double?
    ..longitude = json["longitude"] as double?;

  @override
  String toString() {
    return "latitude: $latitude, longitude: $longitude";
  }
}
