import 'package:intl/intl.dart';

class DateFormatedUtils {
  static String getFormatedDate(DateTime date, String dateFormat) {
    // var formatter = new DateFormat('yyy-MM-dd');
    var formatter = new DateFormat(dateFormat);
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static String get8601FormatedDate(String fromdate) {
    DateTime now = DateTime.parse(fromdate);
    var formatter = DateFormat('E, dd MMM yyyy hh:mm a');
    var formatted = formatter.format(now);
    return formatted;
  }

  String getFormatedDateWithTZone(DateTime date) {
    var formatter = new DateFormat('yyy-MM-dd');
    // var formatter = new DateFormat(dateFormat);
    String formattedDate = formatter.format(date);
    return formattedDate + "T00:00:00Z";
  }
}
