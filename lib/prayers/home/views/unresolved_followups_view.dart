import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/repos/recommendations_repo.dart';
import 'package:prayer_ml/prayers/home/widgets/expandable_collection_card.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class UnresolvedFollowupsView extends ConsumerWidget {
  final int lookbackDays;

  const UnresolvedFollowupsView({
    super.key,
    this.lookbackDays = 30,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedUnresolvedFollowupsNotifierProvider(10,
        lookbackDays: lookbackDays);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Unresolved Follow-ups"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UnresolvedFollowupsExplainer(lookbackDays: lookbackDays),
            const SizedBox(height: 12),
            Expanded(
              child: PagingHelperView(
                provider: provider,
                futureRefreshable: provider.future,
                notifierRefreshable: provider.notifier,
                contentBuilder: (data, widgetCount, endItemView) =>
                    ListView.builder(
                  itemCount: widgetCount,
                  itemBuilder: (context, index) {
                    if (index == widgetCount - 1) {
                      return endItemView;
                    }
                    final followup = data.items[index];
                    return ExpandableCollectionCard(
                      collection: followup.collection,
                      style: CollectionCardStyle.orange,
                      headerWidget: CollectionDateBadge.orange(
                        dateTime: followup.lastPrayerCreationDate,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnresolvedFollowupsExplainer extends StatefulWidget {
  final int lookbackDays;

  const _UnresolvedFollowupsExplainer({required this.lookbackDays});

  @override
  State<_UnresolvedFollowupsExplainer> createState() =>
      _UnresolvedFollowupsExplainerState();
}

class _UnresolvedFollowupsExplainerState
    extends State<_UnresolvedFollowupsExplainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.help_outline,
                    size: 18,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'What does “unresolved” mean?',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.expand_less_rounded
                        : Icons.expand_more_rounded,
                    size: 20,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 8),
                Text(
                  'These are collections with an active follow-up reminder (not expired). '
                  '“Unresolved” means it has not been marked resolved yet. '
                  'We also include collections resolved within the last ${widget.lookbackDays} days so you can double-check follow-through. '
                  'Unresolved items show first.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.3,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
