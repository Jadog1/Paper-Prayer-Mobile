import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/home/widgets/add_collection_update_dialog.dart';
import 'package:prayer_ml/prayers/home/widgets/collection_action_dialogs.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';

/// Configuration for the expandable collection card's visual style
class CollectionCardStyle {
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;

  const CollectionCardStyle({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
  });

  /// Blue theme for current recommendations
  static const blue = CollectionCardStyle(
    primaryColor: Color(0xFF42A5F5), // Colors.blue[300]
    secondaryColor: Color(0xFF90CAF9), // Colors.blue[200]
    accentColor: Color(0xFF1976D2), // Colors.blue[700]
  );

  /// Orange theme for unresolved followups
  static const orange = CollectionCardStyle(
    primaryColor: Color(0xFFFFB74D), // Colors.orange[300]
    secondaryColor: Color(0xFFFFCC80), // Colors.orange[200]
    accentColor: Color(0xFFF57C00), // Colors.orange[700]
  );

  /// Purple theme for historical recommendations
  static const purple = CollectionCardStyle(
    primaryColor: Color(0xFFBA68C8), // Colors.purple[300]
    secondaryColor: Color(0xFFCE93D8), // Colors.purple[200]
    accentColor: Color(0xFF7B1FA2), // Colors.purple[700]
  );
}

/// A reusable expandable card for displaying collection information
/// with optional custom header content (e.g., date badges)
class ExpandableCollectionCard extends ConsumerStatefulWidget {
  final Collection collection;
  final CollectionCardStyle style;
  final Widget? headerWidget;
  final bool initiallyExpanded;
  final bool showActions;

  const ExpandableCollectionCard({
    super.key,
    required this.collection,
    required this.style,
    this.headerWidget,
    this.initiallyExpanded = false,
    this.showActions = true,
  });

  @override
  ConsumerState<ExpandableCollectionCard> createState() => _ExpandableCollectionCardState();
}

class _ExpandableCollectionCardState extends ConsumerState<ExpandableCollectionCard> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  Future<void> _handleAction(String action) async {
    final collection = widget.collection;
    
    try {
      switch (action) {
        case 'prayed':
          // Mark as prayed without snooze
          await ref.read(recommendationRepoProvider.notifier).updateAction(
            collection.id,
            CollectionRecommendationAction.prayed,
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Marked as prayed'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          }
          break;
          
        case 'snooze':
          // Show snooze date picker
          final snoozeUntil = await showSnoozeDialog(context);
          if (snoozeUntil != null && mounted) {
            await ref.read(recommendationRepoProvider.notifier).updateAction(
              collection.id,
              CollectionRecommendationAction.prayed,
              snoozeUntil: snoozeUntil,
            );
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Snoozed until ${_formatDate(snoozeUntil)}'),
                  backgroundColor: Colors.blue[700],
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          }
          break;
          
        case 'resolved':
          // Show confirmation and mark as resolved
          final confirmed = await showResolvedConfirmation(
            context,
            collection.title ?? "this collection",
          );
          if (confirmed && mounted) {
            await ref.read(recommendationRepoProvider.notifier).updateAction(
              collection.id,
              CollectionRecommendationAction.resolved,
            );
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Collection marked as resolved'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            }
          }
          break;
          
        case 'not_relevant':
          // Show confirmation and mark as not relevant
          final confirmed = await showNotRelevantConfirmation(context);
          if (confirmed && mounted) {
            await ref.read(recommendationRepoProvider.notifier).updateAction(
              collection.id,
              CollectionRecommendationAction.notRelevant,
            );
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Marked as not relevant'),
                  backgroundColor: Colors.orange[700],
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          }
          break;
      }
    } catch (e) {
      developer.log("Error handling action: ${e.toString()}");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update: ${e.toString()}'),
            backgroundColor: Colors.red[700],
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  String _formatDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      return '${months[date.month - 1]} ${date.day}';
    } catch (e) {
      return isoDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final collection = widget.collection;

    return InkWell(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Collection header with notebook-style left margin
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left margin line (like notebook paper) - with accent color
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [widget.style.primaryColor, widget.style.secondaryColor],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  
                  // Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Optional header widget (e.g., date badge)
                        if (widget.headerWidget != null) ...[
                          widget.headerWidget!,
                          const SizedBox(height: 8),
                        ],
                        // Collection title
                        Text(
                          collection.title ?? "Untitled",
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Who is being prayed for
                        _PrayingForText(
                          collection: collection,
                          accentColor: widget.style.accentColor,
                        ),
                        const SizedBox(height: 6),
                        // Collection summary
                        if (collection.description != null && collection.description!.isNotEmpty)
                          Text(
                            collection.description!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                              height: 1.4,
                            ),
                            maxLines: _isExpanded ? null : 3,
                            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  
                  // Action menu and expand/collapse icon
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Action menu (three dots)
                      if (widget.showActions)
                        PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'prayed',
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle_outline, size: 18, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Mark as prayed'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'snooze',
                              child: Row(
                                children: [
                                  Icon(Icons.schedule, size: 18, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text('Snooze'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'resolved',
                              child: Row(
                                children: [
                                  Icon(Icons.done_all, size: 18, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Mark resolved'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'not_relevant',
                              child: Row(
                                children: [
                                  Icon(Icons.visibility_off, size: 18, color: Colors.orange),
                                  SizedBox(width: 8),
                                  Text('Not relevant'),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) => _handleAction(value),
                        ),
                      // Expand/collapse icon
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Icon(
                          _isExpanded ? Icons.expand_less : Icons.expand_more,
                          color: Colors.grey[500],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Expanded section with action buttons
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: _ActionButtons(collection: collection),
              ),
            
            // Subtle divider between collections
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayingForText extends StatelessWidget {
  final Collection collection;
  final Color accentColor;

  const _PrayingForText({
    required this.collection,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    String prayingFor = collection.user.name;
    if (collection.relatedContacts.isNotEmpty) {
      final relatedNames = collection.relatedContacts
          .map((contact) => contact.name)
          .join(", ");
      prayingFor += " · $relatedNames";
    }

    return Row(
      children: [
        Icon(Icons.person_outline, size: 14, color: accentColor),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            prayingFor,
            style: TextStyle(
              fontSize: 13,
              color: accentColor,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final Collection collection;

  const _ActionButtons({
    required this.collection,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Add Update button
        Expanded(
          child: TextButton.icon(
            onPressed: () => _showAddUpdateDialog(context),
            icon: const Icon(Icons.add_circle_outline, size: 16),
            label: const Text("Add Update"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.green[700],
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        const SizedBox(width: 8),
        // View All Requests button
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RequestDashboardLoader(
                    collection: collection,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.open_in_new, size: 16),
            label: const Text("View all requests"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showAddUpdateDialog(BuildContext context) async {
    final updateText = await showDialog<String>(
      context: context,
      builder: (context) => AddCollectionUpdateDialog(
        collectionTitle: collection.title ?? "Untitled",
      ),
    );

    if (updateText != null && updateText.isNotEmpty && context.mounted) {
      try {
        // Create a new prayer request with the update text
        final newRequest = PrayerRequest(
          id: 0,
          description: updateText,
          user: collection.user,
          group: collection.group,
          createdAt: DateTime.now().toIso8601String(),
          relatedContactIds: collection.relatedContacts.map((c) => c.id).toList(),
        );

        // Save the request with the enforced collection ID
        await saveNewRequest(newRequest, enforcedCollectionId: collection.id);

        // Show success notification
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Update saved! The collection will be updated shortly.'),
              backgroundColor: Colors.green[700],
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (e) {
        // Show error notification
        // Log the error
        developer.log("Error saving update: ${e.toString()}");
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to save update: ${e.toString()}'),
              backgroundColor: Colors.red[700],
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }
}
