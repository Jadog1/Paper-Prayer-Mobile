import 'package:flutter/material.dart';

/// Shows a date picker for selecting when to snooze until
/// Returns the selected date in ISO format (YYYY-MM-DD) or null if cancelled
Future<String?> showSnoozeDialog(BuildContext context) async {
  final now = DateTime.now();
  final tomorrow = now.add(const Duration(days: 1));
  
  // Quick action buttons for common snooze durations
  final quickActions = [
    ('Tomorrow', tomorrow),
    ('3 days', now.add(const Duration(days: 3))),
    ('1 week', now.add(const Duration(days: 7))),
    ('2 weeks', now.add(const Duration(days: 14))),
  ];
  
  return showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Snooze until when?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Choose when you\'d like to be reminded again:',
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          // Quick action buttons
          ...quickActions.map((action) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: OutlinedButton(
              onPressed: () {
                final dateStr = action.$2.toIso8601String().split('T')[0];
                Navigator.of(context).pop(dateStr);
              },
              child: Text(action.$1),
            ),
          )),
          const Divider(height: 24),
          // Custom date picker button
          ElevatedButton.icon(
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: tomorrow,
                firstDate: tomorrow,
                lastDate: now.add(const Duration(days: 365)),
              );
              
              if (selectedDate != null && context.mounted) {
                final dateStr = selectedDate.toIso8601String().split('T')[0];
                Navigator.of(context).pop(dateStr);
              }
            },
            icon: const Icon(Icons.calendar_today),
            label: const Text('Pick a date'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}

/// Shows a confirmation dialog for marking a collection as not relevant
/// Returns true if confirmed, false otherwise
Future<bool> showNotRelevantConfirmation(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Mark as not relevant?'),
      content: const Text(
        'This collection won\'t be recommended to you again. You can still access it from your collections list.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[700],
          ),
          child: const Text('Mark not relevant'),
        ),
      ],
    ),
  );
  
  return result ?? false;
}

/// Shows a confirmation dialog for marking a collection as resolved
/// Returns true if confirmed, false otherwise
Future<bool> showResolvedConfirmation(BuildContext context, String collectionTitle) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Mark as resolved?'),
      content: Text(
        'This will close "$collectionTitle" and mark all prayer requests as answered. It will automatically reopen later if more updates come.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
          ),
          child: const Text('Mark resolved'),
        ),
      ],
    ),
  );
  
  return result ?? false;
}
