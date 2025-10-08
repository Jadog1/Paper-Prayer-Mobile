import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/requests.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

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

  const ExpandableCollectionCard({
    super.key,
    required this.collection,
    required this.style,
    this.headerWidget,
    this.initiallyExpanded = false,
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
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
            ),
            
            // Expanded section with highlights
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 8),
                child: _HighlightsSection(
                  collection: collection,
                  accentColor: widget.style.accentColor,
                ),
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

class _HighlightsSection extends ConsumerWidget {
  final Collection collection;
  final Color accentColor;

  const _HighlightsSection({
    required this.collection,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highlightsAsync = ref.watch(recentPrayerRequestsProvider(collection.id, n: 5));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Highlights list or loading indicator
        highlightsAsync.when(
          data: (prayerRequests) {
            if (prayerRequests.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "No recent prayer requests",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recent highlights:",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 6),
                ...prayerRequests.map((request) {
                  // Use highlight if available, otherwise use request description
                  final text = request.features?.highlight ?? request.description;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.amber[700],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[800],
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          error: (error, stackTrace) => PrintError(
            caller: "_HighlightsSection",
            error: error,
            stackTrace: stackTrace,
          ),
        ),
        
        const SizedBox(height: 10),
        
        // View All Requests button - more subtle
        TextButton.icon(
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
      ],
    );
  }
}
