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

    
    subgraph Hosting
      Hosting
    end

  end

  FirebaseAuthentication --> MobileApp
  Hosting --> WebApp
  MobileApp --> UploadBucket
  MobileApp --> Collection
  MobileApp --> FirebaseAuthentication 
  Collection --> MobileApp 
  UploadBucket --> FirebaseResizeFunction
  ImageResizeFunction --> ImageResizeBucket 
  ImageResizeFunction --> ImageAnalysisBucket
  ImageResizeBucket --> UploadListenerFunction
  ImageResizeBucket --> MobileApp
  ImageResizeBucket --> WebApp
  UploadListenerFunction --> Collection
  WebApp --> ServeImageInfoFunction
  ServeImageInfoFunction --> Collection
  ImageAnalysisBucket --> FirebaseImageAnalysisFunction
  ImageAnalysisFunction --> Collection 
  ImageAnalysisFunction --> LabelDetection
  LabelDetection --> FirebaseImageAnalysisFunction
  Map --> MobileApp
  Map --> WebApp
```


