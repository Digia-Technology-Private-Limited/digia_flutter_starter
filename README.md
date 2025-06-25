# Digia Flutter Starter

A sample Flutter app built using the [Digia SDK](https://digia.tech), showcasing how to build, update, and release native mobile app flows with Server-Driven UI (SDUI) — all without resubmitting to the App Store or Play Store.

## Description

This project serves as a comprehensive starter application for integrating the Digia SDK into Flutter mobile apps. It demonstrates the core capabilities of Server-Driven UI, allowing developers to push dynamic UI and logic updates to production environments without requiring users to download new app versions from app stores. Key functionalities include seamless integration with Digia's server-driven infrastructure, instant real-time updates to app flows, robust version and release management features akin to Git branching, and built-in support for popular analytics platforms like Clevertap and Mixpanel.

## Getting Started

### Dependencies

* **Flutter SDK**: Latest stable version recommended.
* **Digia SDK**: `digia_ui: ^0.4.0` (or the latest version available on pub.dev).
* **Android SDK**: Platform 34 and Build Tools 34.0.0 (required for Android development).

### Installing

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/Digia-Technology-Private-Limited/digia_flutter_starter.git](https://github.com/Digia-Technology-Private-Limited/digia_flutter_starter.git)
    cd digia_flutter_starter
    ```
2.  **Install the Digia SDK:**
    You can add the SDK using the Flutter command:
    ```bash
    flutter pub add digia_ui
    ```
    Alternatively, manually add it to your `pubspec.yaml` file:
    ```yaml
    dependencies:
      digia_ui: ^0.4.0
    ```
3.  **Install project dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Android Configuration:**
    * Add namespace to `android/app/build.gradle`:
        ```gradle
        android {
          namespace "com.digia.flutterstarter"
          ...
        }
        ```
    * (Optional) Apply SDK and Build Tools globally by editing `android/build.gradle`:
        ```gradle
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
        ```

### Executing program

1.  **Initialize Digia in `main.dart`:**
    Open `lib/main.dart` and ensure the `DigiaUIClient.init` call is configured.
    **Important:** Replace `"projectaccesskey"` with your actual Digia project access key.

    ```dart
    import 'package:digia_ui/digia_ui.dart';
    import 'package:flutter/material.dart';

    // Example MyApp class (define your app's main widget here)
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
    ```
2.  **Run the Flutter app:**
    Once initialized and configured, you can run the Flutter application on your preferred device or emulator:
    ```bash
    flutter run
    ```
    This project includes example flows for Login & Signup, a Home screen with server-driven widgets, and server-controlled navigation.

## Help

If you encounter issues, refer to the following common problems and their solutions:

* **Error: Namespace not specified**
    * **Fix:** Ensure your `android/app/build.gradle` includes the namespace:
        ```
        android {
          namespace "com.digia.flutterstarter"
        }
        ```
* **Error: src refspec main does not match any**
    * **Fix:** This typically occurs after cloning an empty repository or when setting up a new Git repository. Use the following commands:
        ```bash
        git add .
        git commit -m "Initial commit"
        git branch -M main
        git push -u origin main
        ```
For further assistance, you can contact `hello@digia.tech`.

## Authors

This project is primarily developed and maintained by **Tinkerbox Technology Private Limited**.
For specific individual contributors, please refer to the Git commit history.

## Version History

* **0.1.0**
    * Initial release of the Digia Flutter Starter project.
    * Demonstrates core Digia SDK integration and Server-Driven UI capabilities.

## License

This project is copyrighted by Tinkerbox Technology Private Limited. All rights reserved.
More detailed license information will be available soon.

## Acknowledgments

* Digia Technology Private Limited for providing the SDK and infrastructure.
* The Flutter community for their excellent development tools and resources.