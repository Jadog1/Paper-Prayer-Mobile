

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/view_model.dart';

enum CompactionMode {
  withoutRequest, // Very dense is only the title and related contacts
  withRequest, // Dense is the title, related contacts, and the request
}

class CompactRequestCard extends ConsumerStatefulWidget {
  const CompactRequestCard({super.key, required this.request, required this.allRelatedContacts, 
    this.compactionMode = CompactionMode.withRequest, this.child});

  final PrayerRequest request;
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
    var relatedContactText = relatedContactsAsString(findRelatedContacts(widget.allRelatedContacts, widget.request));
    Widget title = expandText(widget.request.title ?? "", 1, style: const TextStyle(fontWeight: FontWeight.bold));
    Widget subtitle = expandText(widget.request.request, 3);
    if (relatedContactText.isNotEmpty) {
      subtitle = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          expandText(relatedContactText, 1, style: const TextStyle(fontStyle: FontStyle.italic)),
          expandText(widget.request.request, 2),
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