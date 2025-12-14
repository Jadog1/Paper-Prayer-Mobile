import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/pipeline_status_model.dart';

/// A compact badge showing pipeline processing status
class PipelineStatusBadge extends StatelessWidget {
  const PipelineStatusBadge({
    super.key,
    required this.pipelineRun,
    this.onTap,
    this.compact = false,
  });

  final PipelineRunDTO pipelineRun;
  final VoidCallback? onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();
    final icon = _getStatusIcon();

    if (compact) {
      return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 12,
                height: 12,
                child: pipelineRun.isRunning
                    ? CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(color),
                        value: pipelineRun.progress,
                      )
                    : Icon(icon, size: 12, color: color),
              ),
              if (!compact) ...[
                const SizedBox(width: 4),
                Text(
                  _getStatusText(),
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: pipelineRun.isRunning
                  ? CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      value: pipelineRun.progress,
                    )
                  : Icon(icon, size: 20, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pipelineRun.statusMessage,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  if (pipelineRun.isRunning) ...[
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: pipelineRun.progress,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 4,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(pipelineRun.progress * 100).toStringAsFixed(0)}% complete',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    if (pipelineRun.hasFailed) return Colors.red;
    if (pipelineRun.isComplete) return Colors.green;
    return Colors.blue;
  }

  IconData _getStatusIcon() {
    if (pipelineRun.hasFailed) return Icons.error;
    if (pipelineRun.isComplete) return Icons.check_circle;
    return Icons.auto_awesome;
  }

  String _getStatusText() {
    if (pipelineRun.hasFailed) return 'Failed';
    if (pipelineRun.isComplete) return 'Done';
    return 'AI';
  }
}

/// A simple inline status indicator for showing in lists
class InlinePipelineStatus extends StatelessWidget {
  const InlinePipelineStatus({
    super.key,
    required this.pipelineRun,
    this.onTap,
  });

  final PipelineRunDTO pipelineRun;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor();

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 10,
              height: 10,
              child: pipelineRun.isRunning
                  ? CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    )
                  : Icon(_getStatusIcon(), size: 10, color: color),
            ),
            const SizedBox(width: 4),
            Text(
              _getShortStatus(),
              style: TextStyle(
                fontSize: 10,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    if (pipelineRun.hasFailed) return Colors.red;
    if (pipelineRun.isComplete) return Colors.green;
    return Colors.blue;
  }

  IconData _getStatusIcon() {
    if (pipelineRun.hasFailed) return Icons.error;
    if (pipelineRun.isComplete) return Icons.check;
    return Icons.sync;
  }

  String _getShortStatus() {
    if (pipelineRun.hasFailed) return 'Failed';
    if (pipelineRun.isComplete) return 'Complete';
    final activeStep = pipelineRun.activeStep;
    if (activeStep != null) {
      return activeStep.stepType.shortName;
    }
    return 'Processing';
  }
}
