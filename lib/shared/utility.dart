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

int daysBetween(DateTime from, DateTime to) {
  from = from.toLocal();
  to = to.toLocal();
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

String dateStringToTextualDate(String date) {
  try {
    DateTime dateTime = DateTime.parse(date).toLocal();
    return timeago.format(dateTime, allowFromNow: true); // Example: 3 hours ago
  } catch (e) {
    return "Invalid date";
  }
}

String dateTimeToTextualDate(DateTime? dateTime) {
  if (dateTime == null) {
    return "Invalid date";
  }
  dateTime = dateTime.toLocal();
  return timeago.format(dateTime, allowFromNow: true); // Example: 3 hours ago
}

bool todayIsBetween(DateTime? start, DateTime? end) {
  if (start == null || end == null) {
    return false;
  }
  DateTime now = DateTime.now();
  start = start.toLocal();
  end = end.toLocal();
  return now.isAfter(start) && now.isBefore(end);
}

bool isSameDateAsToday(DateTime date) {
  date = date.toLocal();
  DateTime today = DateTime.now();
  return date.year == today.year &&
         date.month == today.month &&
         date.day == today.day;
}
