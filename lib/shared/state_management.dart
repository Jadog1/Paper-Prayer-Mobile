import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}

/// Widget to show a loading indicator
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

/// Widget to show an error message with a retry button
class ErrorWidgetWithRetry extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorWidgetWithRetry({
    required this.message,
    required this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class StateRenderer extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final Widget child;
  final VoidCallback onRetry;

  const StateRenderer({
    required this.isLoading,
    required this.errorMessage,
    required this.child,
    required this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingWidget();
    } else if (errorMessage != null) {
      return ErrorWidgetWithRetry(
        message: errorMessage!,
        onRetry: onRetry,
      );
    } else {
      return child;
    }
  }
}
