import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart'; // Ensure this import for Hive integration
import 'package:shapp/pages/home_page.dart';
import 'package:shapp/theme/theme_data.dart';
import 'package:provider/provider.dart';
import 'models/store.dart';
import 'models/stores.dart';

void main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();

  // Register your Hive adapter
  Hive.registerAdapter(StoreAdapter());

  // Open the Hive box you intend to use
  await Hive.openBox('MyBoxer');

  // Run the application with Providers
  runApp(
    ChangeNotifierProvider(
      create: (context) => Stores(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Configure system UI overlay style
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      title: 'ShApp',
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
    );
  }
}
