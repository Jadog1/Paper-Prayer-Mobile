import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_view.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/loadable_widgets.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_margin_space.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';

/// A read-only view of a prayer request with AI-generated summary
class ViewableRequest extends ConsumerWidget {
  const ViewableRequest({
    super.key,
    required this.request,
    this.focusOnEdit,
    this.isExportMode = false,
    this.groupId,
  });

  final PrayerRequest request;
  final VoidCallback? focusOnEdit;
  final bool isExportMode;
  final int? groupId;

  void _showDetailSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                // Drag handle
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Scrollable content
                Expanded(
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    children: [
                      // Title Section
                      Text(
                        request.features?.title ?? "Prayer Request",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                      ),
                      const SizedBox(height: 8),
                      
                      // Metadata row
                      Row(
                        children: [
                          Icon(Icons.person, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            request.user.name,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            dateTimeToDate(request.createdAt),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      
                      // Contact Button
                      if (groupId != null)
                        _buildSection(
                          context,
                          title: "Contact",
                          icon: Icons.person,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ContactView(
                                    contact: request.user,
                                    groupId: groupId!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.green[50],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.green[200]!),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.person, color: Colors.green[700]),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      request.user.name,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.chevron_right, color: Colors.grey[400]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (groupId != null) const SizedBox(height: 16),
                      
                      // Description Section
                      _buildSection(
                        context,
                        title: "Full Description",
                        icon: Icons.description,
                        child: Text(
                          request.description,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Related Contacts Section
                      _buildSection(
                        context,
                        title: "Related People",
                        icon: Icons.people,
                        child: LoadableRelatedContacts(
                          contactId: request.user.id,
                          relatedContactIds: request.relatedContactIds,
                          groupId: groupId,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Collection Section
                      LoadableCollection(
                        requestId: request.id,
                        contactId: request.user.id,
                      ),
                      const SizedBox(height: 16),
                      
                      // Bible Verses Section
                      _buildSection(
                        context,
                        title: "Related Scripture",
                        icon: Icons.menu_book,
                        child: LoadableBibleVerses(requestId: request.id),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: Theme.of(context).primaryColor),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: child,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = request.features != null
        ? request.features!.title
        : request.description;

    return InkWell(
      onTap: isExportMode ? null : () => _showDetailSheet(context, ref),
      onLongPress: (focusOnEdit != null && !isExportMode)
          ? () async {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext modalContext) {
                  return SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit'),
                          onTap: () {
                            Navigator.pop(modalContext);
                            ref.read(paperModeStateProvider).setEditModeOverride(
                                request.id, true);
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              focusOnEdit!();
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                          onTap: () async {
                            Navigator.pop(modalContext);
                            try {
                              await removeRequest(request);
                              ref.read(paperModeStateProvider)
                                  .hidePrayerRequest(request.id);
                            } catch (_) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Failed to delete request. Please try again later.")),
                                );
                                log("Failed to delete request: ${request.id}");
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          : null,
      child: PaperMarginSpace(
        paperLine: Expanded(
          child: Text(
            "• $summary",
            textAlign: TextAlign.left,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
