import 'dart:developer' as developer;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stack_trace/stack_trace.dart';

import 'package:flutter/material.dart';

class PrintError extends StatelessWidget {
  const PrintError({super.key, required this.caller, required this.error, required this.stackTrace});

  final Object error;
  final StackTrace stackTrace;
  final String caller;

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

// InteractiveLoadButton is a button that can be clicked to trigger a customProvider function.
// The button will show a CircularProgressIndicator while the customProvider is running.
class InteractiveLoadButton extends HookConsumerWidget {
  const InteractiveLoadButton({
    super.key, 
    required this.customProvider, this.successCallback, 
    required this.buttonText, this.buttonStyle});

  final Future<void> Function() customProvider;
  final String buttonText;
  final ButtonStyle? buttonStyle;
  final void Function()? successCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingCustomProvider = useState<Future<void>?>(null);
    final snapshot = useFuture(pendingCustomProvider.value);
    final isWaiting = snapshot.connectionState == ConnectionState.waiting;
    final isErrored = snapshot.hasError && !isWaiting;

    if (snapshot.connectionState == ConnectionState.done && !isErrored && successCallback != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        successCallback!();
      });
    }

    if (isErrored) {
      PrintError(caller: 'InteractiveLoadButton', error: snapshot.error!, stackTrace: snapshot.stackTrace!);
    }

    return Column(
      children: [
        ElevatedButton(
          style: buttonStyle,
          onPressed: () async {
            if (isWaiting) {
              return;
            }
        
            final future = customProvider();
            pendingCustomProvider.value = future;
          },
          child: isWaiting
              ? const CircularProgressIndicator()
              : Text(buttonText),
        ),
        if (isErrored)
          const Text('Error', style: TextStyle(color: Colors.red)),
      ],
    );
  }
}

class DeleteConfirmationButton extends HookConsumerWidget {
  const DeleteConfirmationButton({super.key, 
    required this.onDelete, required this.onCancel, required this.child,
    required this.deleteContext});

  final Future<void> Function() onDelete;
  final void Function() onCancel;
  final String deleteContext;
  final Widget child;

  
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