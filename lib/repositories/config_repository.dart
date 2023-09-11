import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class ConfigKeys {
  static const maxUploadFileSizeMb = "MAX_UPLOAD_FILE_SIZE_MB";
  static const maxImageWidth = "MAX_IMAGE_WIDTH";
  static const maxImageHeight = "MAX_IMAGE_HEIGHT";
}

// Mostly based on this article:
// https://medium.com/teamkraken/using-firebase-remote-config-in-flutter-dec10d712c68
class ConfigRepository {
  // singleton instance
  static ConfigRepository? _instance;

  // private constructor
  ConfigRepository._internal() : _remoteConfig = FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _remoteConfig;

  // public factory constructor returns singleton instance
  // - Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class.
  factory ConfigRepository() => _instance ??= ConfigRepository._internal();

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 12),
        ),
      );

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
        const {
          ConfigKeys.maxUploadFileSizeMb: 2 * 1024 * 1024,
          ConfigKeys.maxImageWidth: 1200,
          ConfigKeys.maxImageHeight: 1200,
        },
      );

  Future<void> fetchAndActivate() async {
    bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      debugPrint('The config has been updated.');
    } else {
      debugPrint('The config is not updated..');
    }
  }

  Future<void> initialize() async {
    await _setConfigSettings();
    await _setDefaults();
    await fetchAndActivate();
  }

  int get maxUploadFileSize =>
      _remoteConfig.getInt(ConfigKeys.maxUploadFileSizeMb);

  int get maxImageWidth => _remoteConfig.getInt(ConfigKeys.maxImageWidth);
  int get maxImageHeight => _remoteConfig.getInt(ConfigKeys.maxImageHeight);
}
