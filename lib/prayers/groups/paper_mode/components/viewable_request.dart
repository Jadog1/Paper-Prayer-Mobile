import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  });

  final PrayerRequest request;
  final VoidCallback? focusOnEdit;

  void _showDetailSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.2,
          maxChildSize: 0.75,
          expand: false,
          builder: (_, controller) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text(request.features?.title ?? "",
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(request.description, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                Text("Created At: ${dateTimeToDate(request.createdAt)}",
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                LoadableRelatedContacts(
                    contactId: request.user.id,
                    relatedContactIds: request.relatedContactIds),
                LoadableCollection(
                    requestId: request.id, contactId: request.user.id),
                LoadableBibleVerses(requestId: request.id),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = request.features != null
        ? request.features!.title
        : request.description;

    return InkWell(
      onTap: () => _showDetailSheet(context, ref),
      onLongPress: focusOnEdit != null
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
