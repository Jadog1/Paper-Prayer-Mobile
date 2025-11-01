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
    final content = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue[50]!,
            Colors.white,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Event details card
              _buildEventCard(collection),
              
              const SizedBox(height: 16),
              
              // Prayer requests card
              _buildPrayerRequestsCard(collection),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
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

  Widget _buildEventCard(Collection collection) {
    return Card(
      elevation: 3,
      shadowColor: Colors.blue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blue[50]!.withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Event title with decorative element
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.event,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.event.summary != null && widget.event.summary!.isNotEmpty)
                          Text(
                            widget.event.summary!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: 1.2,
                            ),
                          )
                        else
                          const Text(
                            'Event Details',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        const SizedBox(height: 4),
                        Text(
                          'Prayer Collection Event',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Date range with modern styling
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue[100]!),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.calendar_today, size: 18, color: Colors.blue[700]),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Event Date',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _formatEventDate(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Collection link
              if (widget.config.showCollectionLink) ...[
                const SizedBox(height: 12),
                _buildCollectionLink(collection),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerRequestsCard(Collection collection) {
    return Card(
      elevation: 3,
      shadowColor: Colors.blue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card header with gradient
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[600]!,
                  Colors.blue[400]!,
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.auto_stories,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Prayer Requests',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                
                // Filter toggle in header
                if (widget.config.showFilterToggle) ...[
                  const SizedBox(height: 16),
                  _buildModernFilterToggle(),
                ],
              ],
            ),
          ),
          
          // PaperMode content
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: PaperMode(
              config: PaperModeConfig.readOnly(
                showHeader: false,
                eventId: _showingEventOnly ? widget.event.id : null,
                collectionId: !_showingEventOnly ? collection.id : null,
                maxHeight: 600,
                shrinkWrap: true,
                disablePullToRefresh: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernFilterToggle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    _showingEventOnly ? Icons.filter_alt : Icons.filter_alt_off,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _showingEventOnly 
                        ? 'Event Requests Only'
                        : 'All Collection Requests',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _showingEventOnly = !_showingEventOnly;
                });
              },
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _showingEventOnly ? 'Show All' : 'Filter',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _showingEventOnly ? Icons.unfold_more : Icons.unfold_less,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.blue[50],
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
