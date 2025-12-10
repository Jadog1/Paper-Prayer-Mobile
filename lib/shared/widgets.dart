import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;
import 'package:stack_trace/stack_trace.dart';

import 'package:flutter/material.dart';

class PrintError extends StatelessWidget {
  const PrintError({
    super.key,
    required this.caller,
    required this.error,
    required this.stackTrace,
    this.onRetry,
    this.serverMessage,
    this.title,
    this.message,
    this.compact = false,
  });

  final String caller;
  final Object error;
  final StackTrace stackTrace;
  final VoidCallback? onRetry;
  final String? serverMessage;
  final String? title;
  final String? message;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    // Log error for debugging
    final limitedStackTrace = Trace.from(stackTrace).terse;
    developer.log('Error in $caller', error: error);
    developer.log('StackTrace: $limitedStackTrace');

    // Use LayoutBuilder to detect available space
    return LayoutBuilder(
      builder: (context, constraints) {
        // Auto-detect compact mode if height is constrained
        final shouldUseCompact = compact ||
            (constraints.maxHeight < 300 &&
                constraints.maxHeight != double.infinity);

        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: shouldUseCompact ? 0 : constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(shouldUseCompact ? 12.0 : 24.0),
                child: Column(
                  mainAxisAlignment: shouldUseCompact
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Error Icon
                    Container(
                      padding: EdgeInsets.all(shouldUseCompact ? 8 : 16),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.error_outline,
                        size: shouldUseCompact ? 32 : 64,
                        color: Colors.red[400],
                      ),
                    ),
                    SizedBox(height: shouldUseCompact ? 12 : 24),

                    // Title
                    Text(
                      title ?? 'Oops! Something went wrong',
                      style: TextStyle(
                        fontSize: shouldUseCompact ? 16 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: shouldUseCompact ? 2 : null,
                      overflow: shouldUseCompact ? TextOverflow.ellipsis : null,
                    ),
                    SizedBox(height: shouldUseCompact ? 8 : 12),

                    // User-friendly message
                    Text(
                      message ??
                          'We encountered an unexpected error. Please try again.',
                      style: TextStyle(
                        fontSize: shouldUseCompact ? 13 : 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: shouldUseCompact ? 3 : null,
                      overflow: shouldUseCompact ? TextOverflow.ellipsis : null,
                    ),

                    // Server message if provided
                    if (serverMessage != null && serverMessage!.isNotEmpty) ...[
                      SizedBox(height: shouldUseCompact ? 8 : 16),
                      Container(
                        padding: EdgeInsets.all(shouldUseCompact ? 8 : 12),
                        decoration: BoxDecoration(
                          color: Colors.orange[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange[200]!),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.orange[700],
                              size: shouldUseCompact ? 16 : 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                serverMessage!,
                                style: TextStyle(
                                  fontSize: shouldUseCompact ? 12 : 14,
                                  color: Colors.orange[900],
                                ),
                                maxLines: shouldUseCompact ? 2 : null,
                                overflow: shouldUseCompact
                                    ? TextOverflow.ellipsis
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    SizedBox(height: shouldUseCompact ? 12 : 24),

                    // Retry Button
                    if (onRetry != null)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: onRetry,
                          icon: Icon(
                            Icons.refresh,
                            size: shouldUseCompact ? 18 : 24,
                          ),
                          label: Text(
                            'Try Again',
                            style: TextStyle(
                              fontSize: shouldUseCompact ? 13 : 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              vertical: shouldUseCompact ? 10 : 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),

                    // Debugging info (only shown in debug mode)
                    if (const bool.fromEnvironment('dart.vm.product') ==
                        false) ...[
                      SizedBox(height: shouldUseCompact ? 8 : 16),
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          childrenPadding: EdgeInsets.zero,
                          title: Text(
                            'Debug Information',
                            style: TextStyle(
                              fontSize: shouldUseCompact ? 11 : 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.all(shouldUseCompact ? 8 : 12),
                              width: double.infinity,
                              color: Colors.grey[100],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Location: $caller',
                                    style: TextStyle(
                                      fontSize: shouldUseCompact ? 10 : 11,
                                      fontFamily: 'monospace',
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Error: $error',
                                    style: TextStyle(
                                      fontSize: shouldUseCompact ? 10 : 11,
                                      fontFamily: 'monospace',
                                      color: Colors.red[700],
                                    ),
                                    maxLines: shouldUseCompact ? 5 : null,
                                    overflow: shouldUseCompact
                                        ? TextOverflow.ellipsis
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
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
  const InteractiveLoadButton(
      {super.key,
      required this.customProvider,
      this.successCallback,
      this.buttonText,
      this.childOverride,
      this.buttonStyle});

  final void Function()? successCallback;
  final ButtonStyle? buttonStyle;
  final String? buttonText;
  final Widget? childOverride;
  final Future<void> Function() customProvider;

  @override
  ConsumerState<InteractiveLoadButton> createState() =>
      _InteractiveLoadButtonState();
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
              const SnackBar(
                  content: Text("An error occured. Please try again.")),
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
      child: isWaiting ? const CircularProgressIndicator() : child,
    );
  }
}

class DeleteConfirmationButton extends ConsumerWidget {
  const DeleteConfirmationButton(
      {super.key,
      required this.onDelete,
      required this.onCancel,
      required this.child,
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
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Delete'),
                content: Text(
                    'Are you sure you want to delete this $deleteContext?'),
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
  const CreativeLoadingScreen({
    super.key,
    this.icon = Icons.book,
    this.iconColor = Colors.blue,
    this.primaryText = 'Loading your prayer collection...',
    this.secondaryText = 'Preparing thoughts and prayers',
  });

  final IconData icon;
  final Color iconColor;
  final String primaryText;
  final String secondaryText;

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
            child: Icon(
              widget.icon,
              size: 64,
              color: widget.iconColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.primaryText,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            widget.secondaryText,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
