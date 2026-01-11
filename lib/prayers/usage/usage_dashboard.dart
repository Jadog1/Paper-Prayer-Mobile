import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:prayer_ml/prayers/usage/models/usage_cost_model.dart';
import 'package:prayer_ml/prayers/usage/repos/usage_repo.dart';
import 'package:prayer_ml/prayers/usage/usage_history_view.dart';
import 'package:prayer_ml/shared/widgets.dart';

enum DateRangePreset {
  thisMonth,
  lastMonth,
  thisYear,
  lastYear,
}

class UsageDashboard extends ConsumerStatefulWidget {
  const UsageDashboard({super.key});

  @override
  ConsumerState<UsageDashboard> createState() => _UsageDashboardState();
}

class _UsageDashboardState extends ConsumerState<UsageDashboard> {
  DateRangePreset _selectedPreset = DateRangePreset.thisMonth;

  Map<String, String> _getDateRange(DateRangePreset preset) {
    final now = DateTime.now();
    DateTime start;
    DateTime end;

    switch (preset) {
      case DateRangePreset.thisMonth:
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
        break;
      case DateRangePreset.lastMonth:
        start = DateTime(now.year, now.month - 1, 1);
        end = DateTime(now.year, now.month, 0, 23, 59, 59);
        break;
      case DateRangePreset.thisYear:
        start = DateTime(now.year, 1, 1);
        end = DateTime(now.year, 12, 31, 23, 59, 59);
        break;
      case DateRangePreset.lastYear:
        start = DateTime(now.year - 1, 1, 1);
        end = DateTime(now.year - 1, 12, 31, 23, 59, 59);
        break;
    }

    return {
      'start_date': start.toUtc().toIso8601String(),
      'end_date': end.toUtc().toIso8601String(),
    };
  }

  String _getPresetLabel(DateRangePreset preset) {
    switch (preset) {
      case DateRangePreset.thisMonth:
        return 'This Month';
      case DateRangePreset.lastMonth:
        return 'Last Month';
      case DateRangePreset.thisYear:
        return 'This Year';
      case DateRangePreset.lastYear:
        return 'Last Year';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateRange = _getDateRange(_selectedPreset);
    final usageAsync = ref.watch(fetchUsageCostProvider(
      startDate: dateRange['start_date']!,
      endDate: dateRange['end_date']!,
    ));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Usage & Costs'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Usage History',
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const UsageHistoryView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Date Range Selector
          Container(
            color: theme.colorScheme.primary,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Time Period',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: DateRangePreset.values.map((preset) {
                      final isSelected = _selectedPreset == preset;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(_getPresetLabel(preset)),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedPreset = preset;
                              });
                            }
                          },
                          selectedColor: Colors.white,
                          backgroundColor: Colors.white.withValues(alpha: 0.25),
                          labelStyle: TextStyle(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          side: BorderSide(
                            color: isSelected
                                ? Colors.white
                                : Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: usageAsync.when(
              data: (usage) => _buildUsageContent(context, usage),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => PrintError(
                caller: 'UsageDashboard',
                error: error,
                stackTrace: stack,
                title: 'Unable to Load Usage Data',
                message:
                    'We couldn\'t retrieve your usage information. Please check your connection and try again.',
                onRetry: () {
                  setState(() {
                    // Trigger a rebuild to retry the provider
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageContent(BuildContext context, UsageCostSummary usage) {
    final theme = Theme.of(context);

    // Calculate the effective spend limit based on the selected time period
    final monthsInPeriod = _selectedPreset == DateRangePreset.thisYear ||
            _selectedPreset == DateRangePreset.lastYear
        ? 12
        : 1;
    final effectiveSpendLimit = usage.monthlySpendLimit * monthsInPeriod;

    final spendPercentage = effectiveSpendLimit > 0
        ? (usage.totalCost / effectiveSpendLimit * 100).clamp(0, 100)
        : 0.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary Cards
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  context,
                  'Total Cost',
                  '\$${usage.totalCost.toStringAsFixed(2)}',
                  Icons.attach_money,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  context,
                  'Requests',
                  NumberFormat.compact().format(usage.totalRequests),
                  Icons.api,
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  context,
                  'Tokens',
                  NumberFormat.compact().format(usage.totalTokens),
                  Icons.token,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildSummaryCard(
                  context,
                  _selectedPreset == DateRangePreset.thisYear ||
                          _selectedPreset == DateRangePreset.lastYear
                      ? 'Annual Limit'
                      : 'Monthly Limit',
                  '\$${effectiveSpendLimit.toStringAsFixed(0)}',
                  Icons.credit_card,
                  Colors.purple,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Spend Limit Progress
          if (effectiveSpendLimit > 0) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedPreset == DateRangePreset.thisYear ||
                                _selectedPreset == DateRangePreset.lastYear
                            ? 'Annual Spend'
                            : 'Monthly Spend',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${spendPercentage.toStringAsFixed(1)}%',
                        style: TextStyle(
                          color: spendPercentage > 80
                              ? Colors.red[700]
                              : spendPercentage > 60
                                  ? Colors.orange[700]
                                  : Colors.green[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: spendPercentage / 100,
                      minHeight: 12,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        spendPercentage > 80
                            ? Colors.red
                            : spendPercentage > 60
                                ? Colors.orange
                                : Colors.green,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${usage.totalCost.toStringAsFixed(2)} spent',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '\$${effectiveSpendLimit.toStringAsFixed(0)} limit',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  if (spendPercentage > 80) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red[200]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red[700], size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _selectedPreset == DateRangePreset.thisYear ||
                                      _selectedPreset ==
                                          DateRangePreset.lastYear
                                  ? 'Approaching annual spending limit'
                                  : 'Approaching monthly spending limit',
                              style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Cost Breakdown by Model
          if (usage.breakdown.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.pie_chart,
                        color: theme.colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Cost Distribution',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildPieChart(usage.breakdown),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],

          // Detailed Breakdown Table
          if (usage.breakdown.isNotEmpty) ...[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.table_chart,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Detailed Breakdown',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: Colors.grey[200]),
                  Builder(
                    builder: (context) {
                      final sortedBreakdown = List<UsageCostBreakdown>.from(
                          usage.breakdown)
                        ..sort((a, b) => b.totalCost.compareTo(a.totalCost));

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: sortedBreakdown.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 1,
                          color: Colors.grey[200],
                        ),
                        itemBuilder: (context, index) {
                          final item = sortedBreakdown[index];
                          return _buildBreakdownItem(context, item);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],

          // Empty State
          if (usage.breakdown.isEmpty) ...[
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      size: 64,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No usage data',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'No AI requests were made during this period',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[500],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart(List<UsageCostBreakdown> breakdown) {
    final sortedBreakdown = List<UsageCostBreakdown>.from(breakdown)
      ..sort((a, b) => b.totalCost.compareTo(a.totalCost));

    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
      Colors.deepOrange,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.deepPurple,
      Colors.brown,
    ];

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: PieChart(
                  PieChartData(
                    sections: sortedBreakdown.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final color = colors[index % colors.length];

                      return PieChartSectionData(
                        value: item.totalCost,
                        title: item.totalCost >= 0.01
                            ? '\$${item.totalCost.toStringAsFixed(2)}'
                            : '',
                        color: color,
                        radius: 80,
                        titleStyle: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                    sectionsSpace: 2,
                    centerSpaceRadius: 0,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sortedBreakdown.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final color = colors[index % colors.length];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.caller,
                                style: const TextStyle(fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBreakdownItem(BuildContext context, UsageCostBreakdown item) {
    final theme = Theme.of(context);

    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      title: Text(
        item.caller,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        item.model,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
      trailing: Text(
        '\$${item.totalCost.toStringAsFixed(4)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: theme.colorScheme.primary,
        ),
      ),
      children: [
        _buildDetailRow(
            'Requests', NumberFormat.compact().format(item.totalRequests)),
        _buildDetailRow(
            'Total Tokens', NumberFormat.compact().format(item.totalTokens)),
        _buildDetailRow(
            'Prompt Tokens', NumberFormat.compact().format(item.promptTokens)),
        _buildDetailRow('Completion Tokens',
            NumberFormat.compact().format(item.completionTokens)),
        _buildDetailRow(
            'Cached Tokens', NumberFormat.compact().format(item.cachedTokens)),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
