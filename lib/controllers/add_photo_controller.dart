import 'dart:io';

import 'package:exif/exif.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nature_photos/controllers/user_controller.dart';
import 'package:nature_photos/models/upload_file_info.dart';
import 'package:nature_photos/repositories/config_repository.dart';
import 'package:nature_photos/repositories/upload_file_info_repository.dart';
import 'package:nature_photos/repositories/storage_repository.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as img;

import '../models/exif_data.dart';
import '../screens/start_screen.dart';

class AddPhotoController extends GetxController {
  final storageRepository = Get.find<StorageRepository>();
  final databaseRepository = Get.find<UploadFileInfoRepository>();
  final configRepository = Get.find<ConfigRepository>();
  final imagePicker = Get.find<ImagePicker>();
  final userController = Get.find<UserController>();
  final imageFile = Rx<File?>(null);
  final uploading = false.obs;

  Future<void> pickImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imageFile.value = File(image.path);
    }
  }

  Future<void> uploadImage() async {
    if (imageFile.value == null) return;
    uploading.value = true;
    final exif = await _readExif();
    final exifData = parseExif(exif);
    final uploadFileInfo = UploadFileInfo(
      originalFileName: basenameWithoutExtension(imageFile.value!.path),
      extension: extension(imageFile.value!.path),
      exifData: exifData,
      userId: userController.firebaseUser.value!.uid,
    );
    final id = await databaseRepository.saveData(uploadFileInfo);
    if (id == null) {
      Get.snackbar("Upload", "Error saving upload file info");
      return;
    }

    final tmpImg = img.decodeImage(imageFile.value!.readAsBytesSync())!;
    if (tmpImg.width > configRepository.maxImageWidth ||
        tmpImg.height > configRepository.maxImageHeight) {
      Get.snackbar("Upload", "Resizing for upload");

      // set the larger dimension to the max allowed and other to null
      // copyResize will calculate the other dimension
      final resizeWidth =
          tmpImg.width > tmpImg.height ? configRepository.maxImageWidth : null;

      final resizeHeight =
          tmpImg.height > tmpImg.width ? configRepository.maxImageHeight : null;

      final resizedImage =
          img.copyResize(tmpImg, width: resizeWidth, height: resizeHeight);

      final jpgData = img.encodeJpg(resizedImage);

      await storageRepository.uploadData(
          jpgData, '$id${uploadFileInfo.extension}');
    } else {
      await storageRepository.uploadFile(
          imageFile.value!, '$id${uploadFileInfo.extension}');
    }
    uploading.value = false;
    Get.snackbar("Upload", "File uploaded");
    imageFile.value = null;
    Get.to(() => const StartScreen());
  }

  Future<Map<String, dynamic>> _readExif() async {
    final fileBytes = imageFile.value!.readAsBytesSync();
    final exifData = await readExifFromBytes(fileBytes);
    return exifData;
  }

  ExifMetaData parseExif(Map<String, dynamic> exifData) {
    /* 
GPSVersionID
Indicates the version of GPSInfoIFD. The version is given as 2.3.0.0. This tag is mandatory when
GPSInfo tag is present. Note that the GPSVersionID tag is written as a different byte than the Exif
Version tag.

GPSLatitudeRef
Indicates whether the latitude is north or south latitude. The ASCII value 'N' indicates north latitude,
and 'S' is south latitude.

GPSLongitudeRef
Indicates whether the longitude is east or west longitude. ASCII 'E' indicates east longitude, and 'W' is
west longitude.

GPSLongitude
Indicates the longitude. 
- The longitude is expressed as three RATIONAL values giving the degrees, minutes, and seconds, respectively. 
- If longitude is expressed as degrees, minutes and seconds, 
  - a typical format would be ddd/1,mm/1,ss/1. 
- When degrees and minutes are used and, for example, fractions of minutes are given up to two decimal places, 
  - the format would be ddd/1,mmmm/100,0/1 

GPSLatitude
Indicates the latitude. The latitude is expressed as three RATIONAL values giving the degrees,
minutes, and seconds, respectively. If latitude is expressed as degrees, minutes and seconds, a
typical format would be dd/1,mm/1,ss/1. When degrees and minutes are used and, for example,
fractions of minutes are given up to two decimal places, the format would be dd/1,mmmm/100,0/1.

GPSAltitudeRef
Indicates the altitude used as the reference altitude. If the reference is sea level and the altitude is
above sea level, 0 is given. If the altitude is below sea level, a value of 1 is given and the altitude is
indicated as an absolute value in the GPSAltitude tag. The reference unit is meters. Note that this tag
is BYTE type, unlike other reference tags.

GPSAltitude
Indicates the altitude based on the reference in GPSAltitudeRef. Altitude is expressed as one
RATIONAL value. The reference unit is meters.


To convert degrees, minutes and seconds to decimal degrees, 
you divide minutes by 60, seconds by 3600, add to the degrees 
(degrees + minutes/60 + seconds/3600). 
Latitudes run from -90.00 degrees at the South pole to 90.0 degrees at the North pole. 
Longitudes run from -180.00 degrees to 180.00 degrees. 
West longitudes (locations West of the Greenwich meridian) are positive while 
East longitudes (locations East of the Greenwich meridian) are negative.

*/
    if (exifData.containsKey("GPS GPSLatitude") &&
        exifData.containsKey("GPS GPSLongitude") &&
        exifData.containsKey("GPS GPSLatitudeRef") &&
        exifData.containsKey("GPS GPSLongitudeRef")) {
      final exiflatitude = exifData["GPS GPSLatitude"];
      final exiflongitude = exifData["GPS GPSLongitude"];
      final exiflatitudeRef = exifData["GPS GPSLatitudeRef"];
      final exiflongitudeRef = exifData["GPS GPSLongitudeRef"];

      final latdegrees = exiflatitude!.values.ratios[0].numerator /
          exiflatitude!.values.ratios[0].denominator;

      final latminutes = exiflatitude!.values.ratios[1].numerator /
          exiflatitude!.values.ratios[1].denominator;

      final latSeconds = exiflatitude!.values.ratios[2].numerator /
          exiflatitude!.values.ratios[2].denominator;

      final latitudeDecimalDegrees =
          latdegrees + latminutes / 60 + latSeconds / 3600;

      final londegrees = exiflongitude!.values.ratios[0].numerator /
          exiflatitude!.values.ratios[0].denominator;

      final lonminutes = exiflongitude!.values.ratios[1].numerator /
          exiflatitude!.values.ratios[1].denominator;

      final lonSeconds = exiflongitude!.values.ratios[2].numerator /
          exiflatitude!.values.ratios[2].denominator;

      final longitudeDecimalDegrees =
          londegrees + lonminutes / 60 + lonSeconds / 3600;

      return ExifMetaData()
        ..latitude = exiflatitudeRef!.printable == "N"
            ? latitudeDecimalDegrees
            : -latitudeDecimalDegrees
        ..longitude = exiflongitudeRef!.printable == "E"
            ? longitudeDecimalDegrees
            : -longitudeDecimalDegrees;
    }
    return ExifMetaData();
  }
}
