import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:prayer_ml/prayers/web/repos/mobile_auth_repo.dart';

const String BASE_URL = websiteUrl; // e.g., 'http://localhost:5173/'

class WebViewPage extends ConsumerStatefulWidget {
  const WebViewPage({super.key});

  @override
  ConsumerState<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends ConsumerState<WebViewPage> {
  WebViewController? controller;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
      
      // Step 1 & 2: Get Firebase ID token and exchange for session ID using Riverpod
      final sessionAsyncValue = await ref.read(exchangeFirebaseTokenProvider.future);
      
      // Step 3: Build URL with session_id and platform
      final platform = Theme.of(context).platform == TargetPlatform.iOS ? 'ios' : 'android';
      final webViewUrl = Uri.parse('$BASE_URL/?mobile_session_id=${sessionAsyncValue.sessionId}&platform=$platform');
      
      // Step 4: Initialize WebView controller
      final newController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              if (mounted) {
                setState(() {
                  isLoading = true;
                  errorMessage = null;
                });
              }
            },
            onPageFinished: (String url) {
              if (mounted) {
                setState(() {
                  isLoading = false;
                });
              }
            },
            onWebResourceError: (WebResourceError error) {
              if (mounted) {
                setState(() {
                  errorMessage = 'Failed to load page: ${error.description}';
                  isLoading = false;
                });
              }
            },
          ),
        )
        ..loadRequest(webViewUrl);

      if (mounted) {
        setState(() {
          controller = newController;
        });
      }
      
    } catch (e) {
      if (mounted) {
        setState(() {
          errorMessage = 'Error initializing web view: $e';
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bible Studies'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          if (controller != null)
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _initializeController(); // Re-run full auth flow on refresh
              },
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red[300],
              ),
              const SizedBox(height: 16),
              Text(
                'Error',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    errorMessage = null;
                    isLoading = true;
                  });
                  _initializeController();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (controller == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stack(
      children: [
        WebViewWidget(controller: controller!),
        if (isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
