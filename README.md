# Nature Photos App

# Architecture

```mermaid
graph LR

  subgraph User
    MobileApp
  end

  subgraph GoogleMaps
    Map
  end

  subgraph VisionAI
    LabelDetection
  end

  subgraph Firebase
    subgraph Storage
       UploadBucket 
       ImageResizeBucket
       ImageAnalysisBucket
    end
    subgraph Firestore
       Collection 
    end

    subgraph Functions
      FirebaseResizeFunction
      FirebaseImageAnalysisFunction
    end

    subgraph Authentication
      FirebaseAuthentication
    end
  end

  MobileApp --> UploadBucket 
  Collection --> MobileApp 
  MobileApp --> Collection
  MobileApp --> FirebaseAuthentication
  MobileApp --> Map
  Map --> MobileApp
  FirebaseAuthentication --> MobileApp
  UploadBucket --> FirebaseResizeFunction
  FirebaseResizeFunction --> ImageResizeBucket 
  FirebaseResizeFunction --> ImageAnalysisBucket 
  ImageAnalysisBucket --> FirebaseImageAnalysisFunction
  FirebaseImageAnalysisFunction --> Collection 
  FirebaseImageAnalysisFunction --> LabelDetection
  LabelDetection --> FirebaseImageAnalysisFunction
```

## TODO

- protect google maps api key (restrict usage to this android app)
- separate api key for each version (dev, prod)

# Development

- https://console.cloud.google.com/welcome?project=flutter-nature-photos

- signing

    cd android
    ./gradlew signingReport


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
