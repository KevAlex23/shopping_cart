# kev_commerce

## Libraries & Tools Used

- [get](https://pub.dev/packages/get) (State Management - Dependence Manager)
- [http](https://pub.dev/packages/http) (to consume HTTP resources)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) (to local storage)

## Folder Structure
```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```
Here is the folder structure of this project (clean architecture)
```
lib/
|- const (contains const values to use in global app)
|- controllers (logic layer)
|- data (data layer, contains all about the data management, repository and api resource)
|- domain (entity layer, contains the models)
|- UI (User Interface layer)
```

## Architecture
![Clean Architecture](https://miro.medium.com/max/772/0*ucLr51LpOICwon4Q.jpg)

## Source-control branching model
Trunk Based Development
![Trunk Based Development](https://uploads.toptal.io/blog/image/129304/toptal-blog-image-1551794413174-f4139c4be533dc592d49f9a0bcc330f0.png)

## Getting Started
This project was developed on Flutter v2.10.5 (stable)
```
To run the project:
    |-1 Download the zip code
    |-2 Extract the zip code
    |-3 Rename the extracted folder to 'kev_commerce'
    |-4 Open the folder with Visual Code or Android Studio
    |-5 Open the folder's terminal and run 'flutter pub get'
    |-6 Open the main.dart file inside the folder 'lib'
    |-7 Press f5 to run the project
```


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
