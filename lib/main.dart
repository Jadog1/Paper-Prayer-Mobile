import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './prayers/main.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divine Desk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SafeArea(child: PrayersPage()),
    );
  }
}