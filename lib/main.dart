import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './prayers/main.dart';
import './auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'dart:async';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late StreamSubscription _intentDataStreamSubscription;
  String? _sharedText;

  @override
  void initState() {
    super.initState();

    // Listen to media sharing coming from outside the app while the app is in the memory.
    _intentDataStreamSubscription = ReceiveSharingIntent.instance.getMediaStream().listen(
      (List<SharedMediaFile> value) {
        // Extract text content from shared media files
        if (value.isNotEmpty) {
          // For text sharing, the path or message will contain the actual text
          final sharedText = value
              .where((file) => file.type == SharedMediaType.text)
              .map((file) => file.path) // The path contains the text content for text type
              .join('\n');
          
          if (sharedText.isNotEmpty) {
            setState(() {
              _sharedText = sharedText;
            });
          }
        }
        
        // Tell the library that we are done processing the intent.
        ReceiveSharingIntent.instance.reset();
      },
      onError: (err) {
        debugPrint("Error receiving shared media: $err");
      },
    );

    // Get the media sharing coming from outside the app while the app is closed.
    ReceiveSharingIntent.instance.getInitialMedia().then((List<SharedMediaFile> value) {
      if (value.isNotEmpty) {
        // Extract text content from shared media files
        final sharedText = value
            .where((file) => file.type == SharedMediaType.text)
            .map((file) => file.path) // The path contains the text content for text type
            .join('\n');
        
        if (sharedText.isNotEmpty) {
          setState(() {
            _sharedText = sharedText;
          });
        }
      }
      
      // Tell the library that we are done processing the intent.
      ReceiveSharingIntent.instance.reset();
    });
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  void _clearSharedText() {
    setState(() {
      _sharedText = null;
    });
    // Also reset the sharing intent
    ReceiveSharingIntent.instance.reset();
  }

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
      home: SafeArea(
        child: AuthGate(
          child: PrayersPage(
            sharedText: _sharedText,
            onSharedTextHandled: _clearSharedText,
          ),
        )
      ),
    );
  }
}