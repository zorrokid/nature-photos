# Nature Photos App

# Architecture

```mermaid
graph LR

  MobileApp

  WebApp

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
      ImageResizeFunction
      ImageAnalysisFunction
      UploadListenerFunction
      ServeImageInfoFunction
    end

    subgraph Authentication
      FirebaseAuthentication
    end

  end

  MobileApp --> UploadBucket 
  Collection --> MobileApp 
  MobileApp --> Collection
  MobileApp --> FirebaseAuthentication
  FirebaseAuthentication --> MobileApp
  UploadBucket --> FirebaseResizeFunction
  ImageResizeFunction --> ImageResizeBucket 
  ImageResizeFunction --> ImageAnalysisBucket
  ImageResizeBucket --> UploadListenerFunction
  UploadListenerFunction --> Collection
  WebApp --> ServeImageInfoFunction
  ServeImageInfoFunction --> Collection
  ImageAnalysisBucket --> FirebaseImageAnalysisFunction
  ImageAnalysisFunction --> Collection 
  ImageAnalysisFunction --> LabelDetection
  LabelDetection --> FirebaseImageAnalysisFunction
  ImageResizeBucket --> MobileApp
  ImageResizeBucket --> WebApp
  Collection --> WebApp
  Map --> MobileApp
  Map --> WebApp
```


