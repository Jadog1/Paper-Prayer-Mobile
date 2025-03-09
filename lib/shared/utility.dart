import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String formatTimestamp(String timestamp) {
  try {
    DateTime dateTime = DateTime.parse(timestamp).toLocal();
    return DateFormat.yMMMd().format(dateTime); // Example: Jan 1, 2025, 10:30 AM
  } catch (e) {
    return "Invalid date";
  }
}

String dateToTextualDate(String date) {
  try {
    DateTime dateTime = DateTime.parse(date).toLocal();
    return timeago.format(dateTime); // Example: 3 hours ago
  } catch (e) {
    return "Invalid date";
  }
}