# Digia Flutter Starter

A sample Flutter app built using the [Digia SDK](https://digia.tech), showcasing how to build, update, and release native mobile app flows with Server-Driven UI (SDUI) — all without resubmitting to the App Store or Play Store.

---

## 🚀 What's Inside

This starter project demonstrates:

- **Digia SDK Integration:** Seamlessly connects your Flutter app to Digia's server-driven infrastructure.
- **Instant Flow Updates:** Push UI and logic changes to production without requiring users to download new app versions.
- **Version & Release Management:** Preview, test, and release features just like you would with Git branches.
- **Analytics Ready:** Built-in support for integrating popular analytics platforms like Clevertap, Mixpanel, and more.

---

## 🛠️ Getting Started

Follow these simple steps to get the Digia Flutter Starter up and running on your local machine.

### 1. Clone the Repository

```bash
git clone https://github.com/Digia-Technology-Private-Limited/digia_flutter_starter.git
cd digia_flutter_starter
2. Install the Digia SDK
You can add the SDK using the Flutter command:

Bash

flutter pub add digia_ui
Alternatively, manually add it to your pubspec.yaml file:

YAML

dependencies:
  digia_ui: ^0.3.21
Then, install dependencies:

Bash

flutter pub get
3. Initialize Digia in main.dart
Import the Digia SDK and initialize DigiaUIClient in your main function.

⚠️ Replace "projectaccesskey" with your actual access key.

Dart

import 'package:digia_ui/digia_ui.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Digia Starter App')),
        body: const Center(child: Text('Your app content goes here')),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async setup

  await DigiaUIClient.init(
    accessKey: "projectaccesskey", // <--- REPLACE THIS
    flavorInfo: Debug('main'),
    environment: Environment.development.name,
    baseUrl: "https://app.digia.tech/api/v1",
    networkConfiguration: NetworkConfiguration(
      defaultHeaders: {},
      timeout: 30,
    ),
  );

  DUIFactory().initialize();

  runApp(const MyApp());
}
📱 Android Configuration
1. Add Namespace to android/app/build.gradle
Ensure your android/app/build.gradle file includes the namespace within the android { ... } block:

Gradle

android {
    namespace "com.digia.flutterstarter"
    // ... other configurations
}
2. (Optional) Apply SDK and Build Tools Globally
To set compileSdkVersion and buildToolsVersion for all subprojects, edit android/build.gradle:

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
✨ Example Flows Included
The starter project comes with pre-built example flows to help you understand the implementation:

Login & Signup
Home screen with server-driven widgets
Server-controlled navigation
⚠️ Troubleshooting
Here are solutions for common issues you might encounter:

Error: Namespace not specified
Fix: Add namespace "com.digia.flutterstarter" to your android { } block in android/app/build.gradle.
Error: src refspec main does not match any
Fix: This typically occurs after cloning an empty repository or when setting up a new Git repository. Use the following commands:
<!-- end list -->

Bash

git add .
git commit -m "Initial commit"
git branch -M main
git push -u origin main
📚 Learn More
Website: https://digia.tech
Documentation: Coming Soon
Contact: hello@digia.tech
© 2025 Digia Technology Private Limited. All rights reserved.