import 'package:intl/intl.dart';

String formatTimestamp(String timestamp) {
  try {
    DateTime dateTime = DateTime.parse(timestamp).toLocal();
    return DateFormat.yMMMd().format(dateTime); // Example: Jan 1, 2025, 10:30 AM
  } catch (e) {
    return "Invalid date";
  }
}