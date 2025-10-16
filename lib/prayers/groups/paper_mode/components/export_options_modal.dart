import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:url_launcher/url_launcher.dart';

/// Options for exporting prayer requests
class ExportOptions {
  const ExportOptions({
    this.keepCreatedDateOrder = true,
    this.includeSummaries = false,
    this.useSummariesOnly = false,
  });

  final bool keepCreatedDateOrder;
  final bool includeSummaries;
  final bool useSummariesOnly;

  ExportOptions copyWith({
    bool? keepCreatedDateOrder,
    bool? includeSummaries,
    bool? useSummariesOnly,
  }) {
    return ExportOptions(
      keepCreatedDateOrder: keepCreatedDateOrder ?? this.keepCreatedDateOrder,
      includeSummaries: includeSummaries ?? this.includeSummaries,
      useSummariesOnly: useSummariesOnly ?? this.useSummariesOnly,
    );
  }
}

/// Modal dialog for configuring and executing prayer request export
class ExportOptionsModal extends StatefulWidget {
  const ExportOptionsModal({
    super.key,
    required this.selectedRequests,
  });

  final List<PrayerRequest> selectedRequests;

  @override
  State<ExportOptionsModal> createState() => _ExportOptionsModalState();
}

class _ExportOptionsModalState extends State<ExportOptionsModal> {
  ExportOptions _options = const ExportOptions();

  String _formatExport() {
    List<PrayerRequest> requests = List.from(widget.selectedRequests);
    
    // Sort by date if keeping date order, otherwise by user name
    if (_options.keepCreatedDateOrder) {
      requests.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      requests.sort((a, b) => a.user.name.compareTo(b.user.name));
    }

    StringBuffer buffer = StringBuffer();
    String? lastDateKey;
    String? lastUserKey;

    for (var request in requests) {
      if (_options.keepCreatedDateOrder) {
        // Group by date, then by person within each date
        String dateKey = formatTimestamp(request.createdAt);
        String userKey = request.user.name;

        // Add date header when date changes
        if (dateKey != lastDateKey) {
          if (lastDateKey != null) {
            buffer.writeln(); // Add blank line between date groups
          }
          buffer.writeln(dateKey);
          buffer.writeln('─' * 10); // Add visual separator under date
          lastDateKey = dateKey;
          lastUserKey = null; // Reset user key for new date
        }

        // Add user header when user changes within the same date
        if (userKey != lastUserKey) {
          if (lastUserKey != null) {
            buffer.writeln(); // Add blank line between different people
          }
          buffer.writeln('  $userKey');
          lastUserKey = userKey;
        }

        // Add the prayer request with extra indentation
        String text;
        if (_options.useSummariesOnly) {
          text = request.features?.title ?? request.description;
        } else if (_options.includeSummaries && request.features?.title != null) {
          text = '${request.features!.title} - ${request.description}';
        } else {
          text = request.description;
        }

        buffer.writeln('    • $text');
      } else {
        // Group by person only
        String userKey = request.user.name;

        // Add user header when user changes
        if (userKey != lastUserKey) {
          if (lastUserKey != null) {
            buffer.writeln(); // Add blank line between user groups
          }
          buffer.writeln(userKey);
          buffer.writeln('─' * 10); // Add visual separator under name
          lastUserKey = userKey;
        }

        // Add the prayer request
        String text;
        if (_options.useSummariesOnly) {
          text = request.features?.title ?? request.description;
        } else if (_options.includeSummaries && request.features?.title != null) {
          text = '${request.features!.title} - ${request.description}';
        } else {
          text = request.description;
        }

        buffer.writeln('  • $text');
      }
    }

    return buffer.toString();
  }

  void _copyToClipboard() {
    final text = _formatExport();
    Clipboard.setData(ClipboardData(text: text));
    
    Navigator.pop(context);
    
    // Show snackbar after popping to avoid disposal issues
    Future.microtask(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to clipboard')),
      );
    });
  }

  void _sendEmail() async {
    final text = _formatExport();
    const subject = 'Prayer Requests';
    
    // Create mailto URI
    final Uri emailUri = Uri(
      scheme: 'mailto',
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(text)}',
    );
    
    // Close the modal first to avoid disposal issues
    Navigator.pop(context);
    
    // Try to launch email app
    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        // Fallback: copy to clipboard if can't launch email
        await Clipboard.setData(ClipboardData(text: 'mailto:?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(text)}'));
        Future.microtask(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open email app. mailto link copied to clipboard.'),
              duration: Duration(seconds: 4),
            ),
          );
        });
      }
    } catch (e) {
      // Error handling
      Future.microtask(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error opening email: $e'),
            duration: const Duration(seconds: 4),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            // Header section (fixed)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Export Options',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.selectedRequests.length} prayer request(s) selected',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            
            const Divider(height: 1),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Options section with card background
                    Card(
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                            child: Text(
                              'Grouping',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          RadioListTile<bool>(
                            title: const Text('Group by date'),
                            subtitle: const Text('Show person names within each date'),
                            value: true,
                            groupValue: _options.keepCreatedDateOrder,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            visualDensity: VisualDensity.compact,
                            onChanged: (value) {
                              setState(() {
                                _options = _options.copyWith(keepCreatedDateOrder: value);
                              });
                            },
                          ),
                          RadioListTile<bool>(
                            title: const Text('Group by person'),
                            subtitle: const Text('Show all requests per person'),
                            value: false,
                            groupValue: _options.keepCreatedDateOrder,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            visualDensity: VisualDensity.compact,
                            onChanged: (value) {
                              setState(() {
                                _options = _options.copyWith(keepCreatedDateOrder: value);
                              });
                            },
                          ),
                          const Divider(height: 8),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                            child: Text(
                              'Summary Options',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          CheckboxListTile(
                            title: const Text('Include AI summaries'),
                            subtitle: const Text('Add summaries alongside full requests'),
                            value: _options.includeSummaries,
                            enabled: !_options.useSummariesOnly,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            visualDensity: VisualDensity.compact,
                            onChanged: (value) {
                              setState(() {
                                _options = _options.copyWith(includeSummaries: value);
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: const Text('Use summaries only'),
                            subtitle: const Text('Replace requests with summaries'),
                            value: _options.useSummariesOnly,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                            visualDensity: VisualDensity.compact,
                            onChanged: (value) {
                              setState(() {
                                _options = _options.copyWith(
                                  useSummariesOnly: value,
                                  includeSummaries: value == true ? false : _options.includeSummaries,
                                );
                              });
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Preview label
                    Text(
                      'Preview',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    
                    // Preview section
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: SelectableText(
                          _formatExport(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const Divider(height: 1),
            
            // Action buttons - fixed at bottom with horizontal scroll
            Padding(
              padding: const EdgeInsets.all(16),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.icon(
                        onPressed: _sendEmail,
                        icon: const Icon(Icons.email, size: 18),
                        label: const Text('Email'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.icon(
                        onPressed: _copyToClipboard,
                        icon: const Icon(Icons.copy, size: 18),
                        label: const Text('Copy'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
