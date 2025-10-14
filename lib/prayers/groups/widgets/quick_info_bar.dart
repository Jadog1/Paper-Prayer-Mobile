import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Reusable widget for displaying quick info bar with key dates
class QuickInfoBar extends StatelessWidget {
  const QuickInfoBar({
    super.key,
    this.createdAt,
    this.startDate,
    this.endDate,
    this.expirationDate,
  });

  final String? createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? expirationDate;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('MMM d');
    
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (createdAt != null)
            _DateInfo(
              icon: Icons.calendar_today,
              label: "Created",
              date: format.format(DateTime.parse(createdAt!).toLocal()),
              color: Colors.blue,
            ),
          if (startDate != null) ...[
            const SizedBox(width: 16),
            _DateInfo(
              icon: Icons.event,
              label: "Event Start",
              date: format.format(startDate!.toLocal()),
              color: Colors.green,
            ),
          ],
          if (expirationDate != null) ...[
            const SizedBox(width: 16),
            _DateInfo(
              icon: Icons.event_busy,
              label: "Expires",
              date: format.format(expirationDate!.toLocal()),
              color: Colors.orange,
            ),
          ],
        ],
      ),
    );
  }
}

class _DateInfo extends StatelessWidget {
  const _DateInfo({
    required this.icon,
    required this.label,
    required this.date,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            date,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
