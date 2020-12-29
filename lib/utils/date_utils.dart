import 'package:intl/intl.dart';

class DateUtils {
  // Singleton approach
  static final DateUtils _instance = DateUtils._internal();

  factory DateUtils() => _instance;

  DateUtils._internal();


  String getFormattedDateForDisplay(String dateStamp) {
//    input 2020-08-04 00:00:00.000
//    output 04 Aug 2020
    DateFormat dateFormat = DateFormat("MMM dd, yyyy");
    return dateFormat.format(DateTime.parse(dateStamp));
  }

  String getFormattedDateForWebservice(String dateStamp) {
    // input Aug 29, 2020
    var inputFormat = DateFormat("MMM dd, yyyy");
    var inputDate = inputFormat.parse(dateStamp);
    // output 29-Aug-20
    DateFormat outputFormat = DateFormat("dd-MMM-yy");
    return outputFormat.format(inputDate);
  }
}
