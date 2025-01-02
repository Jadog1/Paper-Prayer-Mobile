import 'dart:developer' as developer;
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