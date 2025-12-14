import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_ml/prayers/groups/models/pipeline_status_model.dart';

/// Shows a detailed view of pipeline processing steps as a full page
class PipelineStatusDetailPage extends StatelessWidget {
  const PipelineStatusDetailPage({
    super.key,
    required this.pipelineRun,
  });

  final PipelineRunDTO pipelineRun;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Processing Status'),
        backgroundColor: _getOverallColor(),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header
          Row(
            children: [
              Icon(
                _getOverallIcon(),
                size: 32,
                color: _getOverallColor(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pipelineRun.statusMessage,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _getOverallColor(),
                      ),
                    ),
                    if (pipelineRun.isRunning) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${(pipelineRun.progress * 100).toStringAsFixed(0)}% Complete',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (pipelineRun.isRunning) ...[
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: pipelineRun.progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                _getOverallColor(),
              ),
              minHeight: 8,
            ),
          ],
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          Text(
            'Pipeline Steps',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          ...pipelineRun.steps
              .asMap()
              .entries
              .map((entry) => _buildStepTile(
                    context,
                    entry.value,
                    entry.key,
                    pipelineRun.steps.length,
                  ))
              .toList(),
          const SizedBox(height: 16),
          _buildTimingInfo(context),
        ],
      ),
    );
  }

  Widget _buildStepTile(
    BuildContext context,
    PipelineStepDTO step,
    int index,
    int totalSteps,
  ) {
    final color = _getStepColor(step.status);
    final icon = _getStepIcon(step.status);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(icon, size: 16, color: color),
              ),
              if (index < totalSteps - 1)
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey[300],
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Step content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.stepType.displayName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        step.status.displayName,
                        style: TextStyle(
                          fontSize: 12,
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (step.attemptCount > 1) ...[
                      const SizedBox(width: 8),
                      Text(
                        'Attempt ${step.attemptCount}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
                if (step.startedAt != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    'Started: ${_formatDateTime(step.startedAt!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
                if (step.completedAt != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Completed: ${_formatDateTime(step.completedAt!)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
                if (step.errorMessage != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.error_outline,
                            size: 16, color: Colors.red[700]),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            step.errorMessage!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.red[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (step.metadata != null &&
                    step.metadata!.isNotEmpty &&
                    step.status == PipelineStepStatus.inProgress) ...[
                  const SizedBox(height: 6),
                  Text(
                    _formatMetadata(step.metadata!),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimingInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Timing Information',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 12),
          _buildTimingRow(
            'Started',
            _formatDateTime(pipelineRun.startedAt),
            Icons.play_arrow,
          ),
          if (pipelineRun.completedAt != null) ...[
            const SizedBox(height: 8),
            _buildTimingRow(
              'Completed',
              _formatDateTime(pipelineRun.completedAt!),
              Icons.check_circle,
            ),
            const SizedBox(height: 8),
            _buildTimingRow(
              'Duration',
              _calculateDuration(),
              Icons.timer,
            ),
          ] else ...[
            const SizedBox(height: 8),
            _buildTimingRow(
              'Running for',
              _calculateRunningTime(),
              Icons.timer,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimingRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Color _getOverallColor() {
    if (pipelineRun.hasFailed) return Colors.red;
    if (pipelineRun.isComplete) return Colors.green;
    return Colors.blue;
  }

  IconData _getOverallIcon() {
    if (pipelineRun.hasFailed) return Icons.error;
    if (pipelineRun.isComplete) return Icons.check_circle;
    return Icons.auto_awesome;
  }

  Color _getStepColor(PipelineStepStatus status) {
    switch (status) {
      case PipelineStepStatus.completed:
        return Colors.green;
      case PipelineStepStatus.inProgress:
        return Colors.blue;
      case PipelineStepStatus.failed:
        return Colors.red;
      case PipelineStepStatus.skipped:
        return Colors.grey;
      case PipelineStepStatus.pending:
        return Colors.orange;
    }
  }

  IconData _getStepIcon(PipelineStepStatus status) {
    switch (status) {
      case PipelineStepStatus.completed:
        return Icons.check;
      case PipelineStepStatus.inProgress:
        return Icons.sync;
      case PipelineStepStatus.failed:
        return Icons.close;
      case PipelineStepStatus.skipped:
        return Icons.skip_next;
      case PipelineStepStatus.pending:
        return Icons.hourglass_empty;
    }
  }

  String _formatDateTime(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString);
      final formatter = DateFormat('MMM d, h:mm a');
      return formatter.format(dateTime.toLocal());
    } catch (_) {
      return isoString;
    }
  }

  String _formatMetadata(Map<String, dynamic> metadata) {
    if (metadata.containsKey('current_subtask')) {
      return 'Current: ${metadata['current_subtask']}';
    }
    if (metadata.containsKey('items_processed')) {
      return 'Processed: ${metadata['items_processed']} items';
    }
    return metadata.entries
        .take(2)
        .map((e) => '${e.key}: ${e.value}')
        .join(', ');
  }

  String _calculateDuration() {
    try {
      final started = DateTime.parse(pipelineRun.startedAt);
      final completed = DateTime.parse(pipelineRun.completedAt!);
      final duration = completed.difference(started);

      if (duration.inHours > 0) {
        return '${duration.inHours}h ${duration.inMinutes % 60}m';
      } else if (duration.inMinutes > 0) {
        return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
      } else {
        return '${duration.inSeconds}s';
      }
    } catch (_) {
      return 'Unknown';
    }
  }

  String _calculateRunningTime() {
    try {
      final started = DateTime.parse(pipelineRun.startedAt);
      final now = DateTime.now();
      final duration = now.difference(started);

      if (duration.inHours > 0) {
        return '${duration.inHours}h ${duration.inMinutes % 60}m';
      } else if (duration.inMinutes > 0) {
        return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
      } else {
        return '${duration.inSeconds}s';
      }
    } catch (_) {
      return 'Unknown';
    }
  }
}

/// Helper function to navigate to the pipeline status detail page
void showPipelineStatusDetail(
    BuildContext context, PipelineRunDTO pipelineRun) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => PipelineStatusDetailPage(pipelineRun: pipelineRun),
    ),
  );
}
