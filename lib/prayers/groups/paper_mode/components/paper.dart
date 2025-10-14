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
    this.onRequestsLoaded,
  });

  final PaperModeConfig config;
  final void Function(List<PrayerRequest>)? onRequestsLoaded;

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
      collectionId: widget.config.collectionId
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

        // Notify parent of loaded requests
        if (widget.onRequestsLoaded != null) {
          widget.onRequestsLoaded!(filteredItems);
        }
            
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
              
              // Get all requests for the last date (used for date break selection)
              final lastDate = filteredItems.last.createdAt;
              final lastDateRequests = filteredItems
                  .where((r) => daysBetween(
                      DateTime.parse(r.createdAt), 
                      DateTime.parse(lastDate)) == 0)
                  .toList();
              
              // Get all requests for the last user on that date (used for username break selection)
              final lastUserId = filteredItems.last.user.id;
              final lastUserRequests = filteredItems
                  .where((r) => r.user.id == lastUserId && daysBetween(
                      DateTime.parse(r.createdAt), 
                      DateTime.parse(lastDate)) == 0)
                  .toList();
              
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  endItemView,
                  dateBreak(
                    filteredItems.last.createdAt, 
                    formatTimestamp,
                    dateRequests: lastDateRequests,
                    ref: ref,
                    context: context,
                  ),
                  usernameBreak(
                    context, 
                    filteredItems.last,
                    userRequests: lastUserRequests,
                    ref: ref,
                  ),
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
              // Get all requests for this date
              final dateRequests = filteredItems
                  .where((r) => daysBetween(
                      DateTime.parse(r.createdAt), 
                      DateTime.parse(filteredItems[index - 1].createdAt)) == 0)
                  .toList();
              
              // Get all requests for this user on that date
              final userRequests = filteredItems
                  .where((r) => r.user.id == filteredItems[index - 1].user.id &&
                      daysBetween(
                          DateTime.parse(r.createdAt), 
                          DateTime.parse(filteredItems[index - 1].createdAt)) == 0)
                  .toList();
              
              widgets.add(dateBreak(
                filteredItems[index - 1].createdAt, 
                formatTimestamp,
                dateRequests: dateRequests,
                ref: ref,
                context: context,
              ));
              widgets.add(usernameBreak(
                context, 
                filteredItems[index - 1],
                userRequests: userRequests,
                ref: ref,
              ));
            } else if (index > 0 &&
                filteredItems[index].user.id !=
                    filteredItems[index - 1].user.id) {
              // Get all requests for this user on the same date as index
              final userRequests = filteredItems
                  .where((r) => r.user.id == filteredItems[index - 1].user.id &&
                      daysBetween(
                          DateTime.parse(r.createdAt), 
                          DateTime.parse(filteredItems[index].createdAt)) == 0)
                  .toList();
              
              widgets.add(usernameBreak(
                context, 
                filteredItems[index - 1],
                userRequests: userRequests,
                ref: ref,
              ));
            }

            if (index == 0 && !widget.config.readOnly) {
              PrayerRequest? previousRequest;
              if (daysBetween(DateTime.parse(filteredItems[index].createdAt), DateTime.now()) >= 1) {
                // Get all requests for today
                final todayRequests = filteredItems
                    .where((r) => daysBetween(
                        DateTime.parse(r.createdAt), 
                        DateTime.now()) == 0)
                    .toList();
                
                widgets.add(dateBreak(
                  DateTime.now().toIso8601String(), 
                  formatTimestamp,
                  dateRequests: todayRequests,
                  ref: ref,
                  context: context,
                ));
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
