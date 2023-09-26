# Nature Photos App

# Architecture

```mermaid
graph LR

  subgraph User
    MobileApp
    WebApp
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
  FirebaseAuthentication --> MobileApp
  UploadBucket --> FirebaseResizeFunction
  FirebaseResizeFunction --> ImageResizeBucket 
  FirebaseResizeFunction --> ImageAnalysisBucket 
  ImageAnalysisBucket --> FirebaseImageAnalysisFunction
  FirebaseImageAnalysisFunction --> Collection 
  FirebaseImageAnalysisFunction --> LabelDetection
  LabelDetection --> FirebaseImageAnalysisFunction
  ResizeBucket --> MobileApp
  ResizeBucket --> WebApp
  Collection --> WebApp
  Map --> MobileApp
  Map --> WebApp
```


