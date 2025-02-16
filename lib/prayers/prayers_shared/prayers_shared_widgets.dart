

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';

enum CompactionMode {
  withoutRequest, // Very dense is only the title and related contacts
  withRequest, // Dense is the title, related contacts, and the request
}

// Accept an interface that has a title, description, and related contacts
abstract class RequestCardInterface {
  final String title;
  final String description;
  final List<int> relatedContactIds;

  RequestCardInterface(this.title, this.description, this.relatedContactIds);
}

class CompactRequestCard extends ConsumerStatefulWidget {
  const CompactRequestCard({super.key, 
    required this.allRelatedContacts, 
    required this.title, required this.description, required this.relatedContactIds,
    this.compactionMode = CompactionMode.withRequest, this.child});

  final String? title;
  final String? description;
  final List<int> relatedContactIds;
  final List<RelatedContact> allRelatedContacts;
  final CompactionMode compactionMode;
  final Widget? child;

  @override
  ConsumerState<CompactRequestCard> createState() => _CompactRequestCardState();
}
class _CompactRequestCardState extends ConsumerState<CompactRequestCard> {
  var _expandedMode = false;

  Widget expandText(String text, int maxLines, {style = const TextStyle()}) {
    return Text(
      text, 
      overflow: _expandedMode ? TextOverflow.visible : TextOverflow.ellipsis, 
      maxLines: _expandedMode ? null : maxLines,
      style: style,
      );
  }

  @override
  Widget build(BuildContext context) {
    var relatedContactText = relatedContactsAsString(findRelatedContacts(widget.allRelatedContacts, widget.relatedContactIds));
    Widget title = expandText(widget.title ?? "", 1, style: const TextStyle(fontWeight: FontWeight.bold));
    Widget subtitle = expandText(widget.description ?? "", 3);
    if (relatedContactText.isNotEmpty) {
      subtitle = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          expandText(relatedContactText, 1, style: const TextStyle(fontStyle: FontStyle.italic)),
          expandText(widget.description ?? "", 2),
        ],
      );
    }
    var subtitleWithChild = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subtitle,
        widget.child ?? const SizedBox.shrink(),
      ],
    );

    double height = widget.compactionMode == CompactionMode.withoutRequest ? 60 : 105;
    
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
          maxHeight: _expandedMode ? double.infinity : height,
        ),
        child: Card(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          child: ListTile(
            leading: _expandedMode ? const Icon(Icons.chevron_left) : const Icon(Icons.chevron_right),
            title: title,
            subtitle: !_expandedMode ? 
              widget.compactionMode == CompactionMode.withRequest ? subtitle : null 
              : subtitleWithChild,
            // trailing: sentimentIcon(request.sentiment),
            visualDensity: VisualDensity.compact,
            onTap: () => setState(() => _expandedMode = !_expandedMode),
          ),
        ),
      ),
    );
  }
}