# Digia Flutter Starter

A sample Flutter app built using the [Digia SDK](https://digia.tech), showcasing how to build, update, and release native mobile app flows with Server-Driven UI -- without resubmitting to the App Store or Play Store.

---

## What's Inside

- Digia SDK Integration - Connect your Flutter app to Digia's server-driven infrastructure.
- Instant Flow Updates - Push UI and logic changes to production without user downloads.
- Version & Release Management - Preview, test, and release features like Git branches.
- Analytics Ready - Built-in support for integrating Clevertap, Mixpanel, and more.

---

## Getting Started

### 1. Clone the Repo

```bash
git clone [https://github.com/Digia-Technology-Private-Limited/digia_flutter_starter.git](https://github.com/Digia-Technology-Private-Limited/digia_flutter_starter.git)
cd digia_flutter_starter
Install the Digia SDK You can add the SDK using the Flutter command:
<!-- end list -->

Bash

flutter pub add digia_ui
Or manually add it to pubspec.yaml:

YAML

dependencies:
  digia_ui: ^0.3.21
Then install dependencies:

Bash

flutter pub get
Initialize Digia in main.dart
<!-- end list -->

Dart

import 'package:digia_ui/digia_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // REMOVE THIS LINE IF ALREADY INITIALIZED

  await DigiaUIClient.init(
    accessKey: "projectaccesskey", // ADD YOUR KEY HERE
    flavorInfo: Debug('main'),
    environment: Environment.development.name,
    baseUrl: "[https://app.digia.tech/api/v1](https://app.digia.tech/api/v1)",
    networkConfiguration: NetworkConfiguration(
      defaultHeaders: {},
      timeout: 30,
    ),
  );
  DUIFactory().initialize();
  runApp(const MyApp());
}
Android Configuration
Add namespace to android/app/build.gradle
<!-- end list -->

Gradle

android {
  namespace "com.digia.flutterstarter"
  ...
}
(Optional) Apply SDK and Build Tools globally Edit android/build.gradle:
<!-- end list -->

Gradle

subprojects {
  afterEvaluate { project ->
    if (project.plugins.hasPlugin("com.android.application") ||
        project.plugins.hasPlugin("com.android.library")) {
      project.android {
        compileSdkVersion 34
        buildToolsVersion "34.0.0"
      }
    }
  }
}
Example Flows Included
Login & Signup
Home screen with server-driven widgets
Server-controlled navigation
Troubleshooting
Error: Namespace not specified
Fix:

android {
  namespace "com.digia.flutterstarter"
}
Error: src refspec main does not match any
Fix:

Bash

git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
Learn More
Website: https://digia.tech
Documentation: Coming Soon
Contact: hello@digia.tech
2025 Digia Technology Private Limited. All rights reserved.