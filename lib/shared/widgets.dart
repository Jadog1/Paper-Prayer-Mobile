import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;
import 'package:stack_trace/stack_trace.dart';

import 'package:flutter/material.dart';

class PrintError extends StatelessWidget {
  const PrintError({super.key, required this.caller, required this.error, required this.stackTrace});

  final String caller;
  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    final limitedStackTrace = Trace.from(stackTrace).terse;
    developer.log('Error in $caller', error: error);
    developer.log('StackTrace: $limitedStackTrace');

    return Text('Oops, something unexpected happened, $error');
  }
}

const deleteButtonStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.red),
  foregroundColor: WidgetStatePropertyAll(Colors.white),
);

const saveButtonStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.green),
  foregroundColor: WidgetStatePropertyAll(Colors.white),
);

ButtonStyle transparentButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  elevation: 0,
  padding: EdgeInsets.zero,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.zero, // Ensures no border radius
  ),
);

// InteractiveLoadButton is a button that can be clicked to trigger a customProvider function.
// The button will show a CircularProgressIndicator while the customProvider is running.
class InteractiveLoadButton extends ConsumerStatefulWidget {
  const InteractiveLoadButton({
    super.key, 
    required this.customProvider, this.successCallback, 
    this.buttonText, this.childOverride,
    this.buttonStyle});

  final void Function()? successCallback;
  final ButtonStyle? buttonStyle;
  final String? buttonText;
  final Widget? childOverride;
  final Future<void> Function() customProvider;

  @override
  ConsumerState<InteractiveLoadButton> createState() => _InteractiveLoadButtonState();
}
class _InteractiveLoadButtonState extends ConsumerState<InteractiveLoadButton> {
  var isWaiting = false;

  @override
  Widget build(BuildContext context) {
    var child = widget.childOverride ?? Text(widget.buttonText ?? '');
    return ElevatedButton(
      style: widget.buttonStyle,
      onPressed: () async {
        if (isWaiting) {
          return;
        }
        setState(() {
          isWaiting = true;
        });

        var hasError = false;
        try {
          await widget.customProvider();
        } catch (e) {
          hasError = true;
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("An error occured. Please try again.")),
            );
            developer.log('Error in InteractiveLoadButton', error: e);
            developer.log('StackTrace: ${Trace.current}');
          }
        }

        setState(() {
          isWaiting = false;
        });

        if (!hasError && widget.successCallback != null) {
          widget.successCallback!();
        }
      },
      child: isWaiting
          ? const CircularProgressIndicator()
          : child,
    );
  }
}

class DeleteConfirmationButton extends ConsumerWidget {
  const DeleteConfirmationButton({super.key, 
    required this.onDelete, required this.onCancel, required this.child,
    required this.deleteContext});

  final Widget child;
  final String deleteContext;
  final void Function() onCancel;
  final Future<void> Function() onDelete;

  Future<void> Function() deleteAndGoBack(BuildContext context) {
    return () async {
      onDelete();
      Navigator.of(context).pop();
    };
  }

  Future<void> Function() cancelAndGoBack(BuildContext context) {
    return () async {
      onCancel();
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text('Delete'),
            content: Text('Are you sure you want to delete this $deleteContext?'),
            actions: [
              TextButton(
                onPressed: cancelAndGoBack(context),
                child: const Text('Cancel'),
              ),
              InteractiveLoadButton(
                customProvider: deleteAndGoBack(context),
                buttonStyle: deleteButtonStyle,
                buttonText: 'Delete',
               ),
            ],
          );
        });
      },
      child: child,
    );
  }
}

class CreativeLoadingScreen extends StatefulWidget {
  const CreativeLoadingScreen({super.key});

  @override
  State<CreativeLoadingScreen> createState() => _CreativeLoadingScreenState();
}

class _CreativeLoadingScreenState extends State<CreativeLoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _animation,
            child: const Icon(
              Icons.book,
              size: 64,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Loading your prayer collection...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Text(
            'Preparing thoughts and prayers',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}