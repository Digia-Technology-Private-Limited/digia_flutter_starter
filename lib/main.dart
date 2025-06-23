import 'package:digia_ui/digia_ui.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await DigiaUIClient.init(
    accessKey: "685900318d521d92457d0d38",
    // developerConfig: DeveloperConfig(proxyUrl: '192.168.1.53:9090'),
    // flavorInfo: Release(PrioritizeNetwork(500), 'assets/appConfig.json', 'assets/function.js'),
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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DigiaUIScope( child: MaterialApp(
      title: 'Digia Flutter Starter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  DUIFactory().createPage(
        'homepage',
        {},
      ),
    ))

    ;
  }
}


