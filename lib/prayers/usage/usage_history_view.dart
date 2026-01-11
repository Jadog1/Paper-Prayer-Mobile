import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/prayers/usage/models/usage_history_model.dart';
import 'package:prayer_ml/prayers/usage/repos/usage_history_repo.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

class UsageHistoryView extends ConsumerWidget {
  const UsageHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = paginatedUsageHistoryNotifierProvider(20);
    final groupNameMapAsync = ref.watch(groupNameMapProvider);
    final groupNameMap = groupNameMapAsync.maybeWhen(
      data: (value) => value,
      orElse: () => const <int, String>{},
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage History'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: PagingHelperView(
          provider: provider,
          futureRefreshable: provider.future,
          notifierRefreshable: provider.notifier,
          contentBuilder: (data, widgetCount, endItemView) => ListView.builder(
            itemCount: widgetCount,
            itemBuilder: (context, index) {
              if (index == widgetCount - 1) {
                return endItemView;
              }

              final item = data.items[index];
              final groupId = item.prayerRequest?.group.groupId;
              final groupName = groupId != null ? groupNameMap[groupId] : null;

              return _UsageHistoryRow(
                item: item,
                groupName: groupName,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UsageHistoryRow extends StatelessWidget {
  const _UsageHistoryRow({
    required this.item,
    required this.groupName,
  });

  final GenAIUsageHistoryItem item;
  final String? groupName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final usage = item.usage;

    final createdAtLocal = _tryParseDateTime(usage.createdAt)?.toLocal();
    final whenText = createdAtLocal != null
        ? DateFormat('MMM d, yyyy • h:mm a').format(createdAtLocal)
        : usage.createdAt;

    final contextLabel = _contextLabel(item, groupName);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with caller and key metrics
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: Caller and datetime
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        usage.caller,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        whenText,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (contextLabel != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          contextLabel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Right side: Tokens and Cost
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Tokens
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            _fmtCompactIntOrDash(usage.tokensUsed),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            'tokens',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Cost
                    if (item.cost != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _fmtUsd(item.cost!.totalCost, fractionDigits: 4),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Action buttons
            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () => _showTokenDetailsModal(context, item),
                  icon: const Icon(Icons.analytics_outlined, size: 18),
                  label: const Text('Token Details'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
                if (item.prayerRequest != null) ...[
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () =>
                        _showPrayerRequestModal(context, item, groupName),
                    icon: const Icon(Icons.article_outlined, size: 18),
                    label: const Text('Prayer Request'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
                if (item.paperStudyTitle != null &&
                    item.paperStudyTitle!.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () => _showBibleStudyModal(context, item),
                    icon: const Icon(Icons.menu_book_outlined, size: 18),
                    label: const Text('Bible Study'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showTokenDetailsModal(
      BuildContext context, GenAIUsageHistoryItem item) {
    final theme = Theme.of(context);
    final usage = item.usage;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Token & Cost Details',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Model and endpoint info
            if (usage.model.isNotEmpty || usage.endpoint.isNotEmpty) ...[
              _InfoChip(
                label: 'Model',
                value: usage.model.isNotEmpty ? usage.model : '—',
              ),
              const SizedBox(height: 8),
              _InfoChip(
                label: 'Endpoint',
                value: usage.endpoint.isNotEmpty ? usage.endpoint : '—',
              ),
              const Divider(height: 32),
            ],
            // Token breakdown
            Text(
              'Token Usage',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            _DetailRow(
              label: 'Total tokens',
              value: _fmtIntOrDash(usage.tokensUsed),
              isBold: true,
            ),
            _DetailRow(
              label: 'Prompt tokens',
              value: _fmtIntOrDash(usage.promptTokens),
            ),
            _DetailRow(
              label: 'Completion tokens',
              value: _fmtIntOrDash(usage.completionTokens),
            ),
            _DetailRow(
              label: 'Cached tokens',
              value: _fmtIntOrDash(usage.cachedTokens),
            ),
            // Cost breakdown
            if (item.cost != null) ...[
              const Divider(height: 32),
              Text(
                'Cost Breakdown',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _DetailRow(
                label: 'Total cost',
                value: _fmtUsd(item.cost!.totalCost, fractionDigits: 4),
                isBold: true,
              ),
              _DetailRow(
                label: 'Prompt cost',
                value: _fmtUsd(item.cost!.promptCost, fractionDigits: 4),
              ),
              _DetailRow(
                label: 'Completion cost',
                value: _fmtUsd(item.cost!.completionCost, fractionDigits: 4),
              ),
              _DetailRow(
                label: 'Cached cost',
                value: _fmtUsd(item.cost!.cachedCost, fractionDigits: 4),
              ),
            ],
            // Pipeline step IDs
            if (usage.prayerRequestPipelineStepId != null ||
                usage.paperStudyPipelineStepId != null) ...[
              const Divider(height: 32),
              if (usage.prayerRequestPipelineStepId != null)
                _DetailRow(
                  label: 'Prayer pipeline step',
                  value: usage.prayerRequestPipelineStepId.toString(),
                ),
              if (usage.paperStudyPipelineStepId != null)
                _DetailRow(
                  label: 'Study pipeline step',
                  value: usage.paperStudyPipelineStepId.toString(),
                ),
            ],
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPrayerRequestModal(
    BuildContext context,
    GenAIUsageHistoryItem item,
    String? groupName,
  ) {
    final theme = Theme.of(context);
    final prayerRequest = item.prayerRequest!;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.article, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Prayer Request',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Contact and group info
              _InfoChip(
                label: 'From',
                value: prayerRequest.user.name,
              ),
              if (groupName != null && groupName.isNotEmpty) ...[
                const SizedBox(height: 8),
                _InfoChip(
                  label: 'Group',
                  value: groupName,
                ),
              ],
              const Divider(height: 32),
              Text(
                'Prayer Request',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text(
                    prayerRequest.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBibleStudyModal(BuildContext context, GenAIUsageHistoryItem item) {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.menu_book, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Bible Study',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              item.paperStudyTitle!,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String? _contextLabel(GenAIUsageHistoryItem item, String? groupName) {
    if (item.prayerRequest != null) {
      final contactName = item.prayerRequest!.user.name.trim();
      final safeGroupName = (groupName ?? '').trim();

      if (contactName.isNotEmpty && safeGroupName.isNotEmpty) {
        return 'For $contactName • $safeGroupName';
      }
      if (contactName.isNotEmpty) {
        return 'For $contactName';
      }
      if (safeGroupName.isNotEmpty) {
        return 'For $safeGroupName';
      }
      return 'From prayer request pipeline';
    }

    if (item.paperStudyTitle != null &&
        item.paperStudyTitle!.trim().isNotEmpty) {
      return 'From bible study generation';
    }

    return null;
  }

  static String _fmtIntOrDash(int? v) {
    if (v == null) return '—';
    return NumberFormat.decimalPattern().format(v);
  }

  static String _fmtUsd(double amount, {required int fractionDigits}) {
    return '\$${amount.toStringAsFixed(fractionDigits)}';
  }

  static String _fmtCompactIntOrDash(int? v) {
    if (v == null) return '—';
    return NumberFormat.compact().format(v);
  }

  static DateTime? _tryParseDateTime(String raw) {
    try {
      return DateTime.parse(raw);
    } catch (_) {
      return null;
    }
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  final String label;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
