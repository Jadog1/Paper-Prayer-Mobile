import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';
import 'package:prayer_ml/prayers/groups/repos/collection_repo.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/home/calendar/models/event_details_config.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Widget for displaying event details with associated prayer requests
class EventDetailsWidget extends ConsumerStatefulWidget {
  const EventDetailsWidget({
    super.key,
    required this.event,
    required this.config,
  });

  final PrayerCollectionEvent event;
  final EventDetailsConfig config;

  @override
  ConsumerState<EventDetailsWidget> createState() => _EventDetailsWidgetState();
}

class _EventDetailsWidgetState extends ConsumerState<EventDetailsWidget> {
  late bool _showingEventOnly;

  @override
  void initState() {
    super.initState();
    _showingEventOnly = widget.config.defaultShowEventOnly;
  }

  @override
  Widget build(BuildContext context) {
    final collectionAsync = ref.watch(fetchCollectionForEventProvider(widget.event.id));

    return collectionAsync.when(
      data: (collection) => _buildContent(context, collection),
      loading: () => _buildScaffold(
        body: const CreativeLoadingScreen(),
      ),
      error: (error, stackTrace) => _buildScaffold(
        body: PrintError(
          caller: "EventDetailsWidget",
          error: error,
          stackTrace: stackTrace,
        ),
      ),
    );
  }

  Widget _buildScaffold({required Widget body}) {
    if (!widget.config.showAppBar) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.config.title ?? "Event Prayer Requests"),
        backgroundColor: widget.config.appBarColor,
        actions: widget.config.showDeleteButton ? [_buildDeleteButton()] : null,
      ),
      body: body,
    );
  }

  Widget _buildContent(BuildContext context, Collection collection) {
    final content = Column(
      children: [
        // Event summary header
        _buildEventHeader(collection),
        
        // Paper mode with event or collection filter (read-only)
        Expanded(
          child: PaperMode(
            config: PaperModeConfig.readOnly(
              showHeader: false,
              eventId: _showingEventOnly ? widget.event.id : null,
              collectionId: !_showingEventOnly ? collection.id : null,
            ),
          ),
        ),
      ],
    );

    if (!widget.config.showAppBar) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.config.title ?? "Event Prayer Requests"),
        backgroundColor: widget.config.appBarColor,
        actions: widget.config.showDeleteButton ? [_buildDeleteButton()] : null,
      ),
      body: content,
    );
  }

  Widget _buildEventHeader(Collection collection) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border(
          bottom: BorderSide(color: Colors.blue[200]!, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event title/summary
          if (widget.event.summary != null && widget.event.summary!.isNotEmpty)
            Text(
              widget.event.summary!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          const SizedBox(height: 8),
          
          // Date range
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.blueAccent),
              const SizedBox(width: 6),
              Text(
                _formatEventDate(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          
          // Collection link
          if (widget.config.showCollectionLink) ...[
            const SizedBox(height: 12),
            _buildCollectionLink(collection),
          ],
          
          // Filter toggle
          if (widget.config.showFilterToggle) ...[
            const SizedBox(height: 12),
            _buildFilterToggle(),
          ],
        ],
      ),
    );
  }

  Widget _buildCollectionLink(Collection collection) {
    return InkWell(
      onTap: () {
        if (widget.config.onCollectionTap != null) {
          widget.config.onCollectionTap!(context, collection);
        } else {
          // Default navigation
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RequestDashboardLoader(
                collection: collection,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue[200]!),
        ),
        child: Row(
          children: [
            const Icon(Icons.folder_outlined, size: 16, color: Colors.blueAccent),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                'Collection: ${collection.title ?? "Untitled"}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.open_in_new, size: 16, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[300]!),
      ),
      child: Row(
        children: [
          const Icon(Icons.filter_list, size: 18, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _showingEventOnly 
                ? 'Showing: Requested for Event Only'
                : 'Showing: All requests in collection',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _showingEventOnly = !_showingEventOnly;
              });
            },
            icon: Icon(
              _showingEventOnly ? Icons.unfold_more : Icons.unfold_less,
              size: 18,
            ),
            label: Text(_showingEventOnly ? 'Show All' : 'Show Event Only'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton() {
    return DeleteConfirmationButton(
      onDelete: () async {
        try {
          await ref.read(deleteEventProvider(widget.event.id).future);
          if (context.mounted) {
            if (widget.config.onEventDeleted != null) {
              widget.config.onEventDeleted!();
            } else {
              Navigator.of(context).pop();
            }
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error deleting event: $e'),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      },
      onCancel: () {},
      deleteContext: "event",
      child: const Icon(Icons.delete),
    );
  }

  String _formatEventDate() {
    try {
      final startDate = DateTime.parse(widget.event.eventStart);
      final startFormatted = "${startDate.month}/${startDate.day}/${startDate.year}";
      
      if (widget.event.eventEnd != null && widget.event.eventEnd!.isNotEmpty) {
        final endDate = DateTime.parse(widget.event.eventEnd!);
        final endFormatted = "${endDate.month}/${endDate.day}/${endDate.year}";
        return "$startFormatted - $endFormatted";
      }
      
      return startFormatted;
    } catch (e) {
      return widget.event.eventStart;
    }
  }
}
