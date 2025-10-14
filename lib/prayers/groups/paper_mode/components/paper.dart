import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/breaks.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/new_requests_manager.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_block.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/repos/notebook_repo.dart';
import 'package:prayer_ml/shared/utility.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

/// The main paper widget that displays paginated prayer requests
class Paper extends ConsumerStatefulWidget {
  const Paper({
    super.key,
    required this.config,
  });

  final PaperModeConfig config;

  @override
  ConsumerState<Paper> createState() => _PaperState();
}

class _PaperState extends ConsumerState<Paper> {
  @override
  Widget build(BuildContext context) {
    final provider = paginatedPrayerRequestsNotifierProvider(
      widget.config.pageSize,
      widget.config.groupId,
      widget.config.contactId,
      eventId: widget.config.eventId,
    );
    
    final stateNotifier = ref.watch(paperModeStateProvider);
    final state = stateNotifier.state;
    
    return PagingHelperView(
      provider: provider,
      futureRefreshable: provider.future,
      notifierRefreshable: provider.notifier,
      contentBuilder: (data, widgetCount, endItemView) {
        var filteredItems = widget.config.contactId != null
            ? data.items
                .where((r) => r.user.id == widget.config.contactId)
                .toList()
            : data.items;
            
        return ListView.builder(
          itemCount: filteredItems.length + 1,
          reverse: true,
          itemBuilder: (context, index) {
            if (index == filteredItems.length) {
              if (filteredItems.isEmpty) {
                return widget.config.readOnly || widget.config.groupContacts == null
                    ? const SizedBox.shrink()
                    : NewRequestsManager(
                        previousRequest: null,
                        currentGroup: widget.config.groupContacts!,
                        config: widget.config,
                      );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  endItemView,
                  dateBreak(filteredItems.last.createdAt, formatTimestamp),
                  usernameBreak(context, filteredItems.last)
                ],
              );
            }
            
            var request = filteredItems[index];

            List<Widget> widgets = [];
            if (state.hiddenPrayerRequests.containsKey(request.id) == false) {
              widgets.add(PaperBlock(
                prayerRequest: request,
                currentGroup: widget.config.groupContacts,
                config: widget.config,
                allowsAIMode: true,
                newRequest: false,
              ));
            }

            if (index > 0 &&
                daysBetween(DateTime.parse(filteredItems[index].createdAt),
                        DateTime.parse(filteredItems[index - 1].createdAt)) >=
                    1) {
              widgets.add(dateBreak(
                  filteredItems[index - 1].createdAt, formatTimestamp));
              widgets.add(usernameBreak(context, filteredItems[index - 1]));
            } else if (index > 0 &&
                filteredItems[index].user.id !=
                    filteredItems[index - 1].user.id) {
              widgets.add(usernameBreak(context, filteredItems[index - 1]));
            }

            if (index == 0 && !widget.config.readOnly) {
              PrayerRequest? previousRequest;
              if (daysBetween(DateTime.parse(filteredItems[index].createdAt), DateTime.now()) >= 1) {
                widgets.add(dateBreak(
                    DateTime.now().toIso8601String(), formatTimestamp));
                previousRequest = filteredItems[index];
              }

              widgets.add(NewRequestsManager(
                previousRequest: previousRequest,
                currentGroup: widget.config.groupContacts!,
                config: widget.config,
              ));
            } else if (index == 0 && widget.config.readOnly) {
              // Add a spacing at the bottom for read-only mode
              widgets.add(const SizedBox(height: 16));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            );
          },
        );
      },
    );
  }
}
