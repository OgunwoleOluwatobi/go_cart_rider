import 'package:intl/intl.dart';

class DateFormatUtil {
  DateFormatUtil._();

  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');
  static final timeFormat = DateFormat('hh:mm a');
  static final dateMonthTimeFormat = DateFormat('dd MMM, hh:mm a');
  static final yyyymmdd = DateFormat('yyyy-MM-dd');
  static final ddmmyyyy = DateFormat('dd/MM/yyyy');
  static final mmmddyyy = DateFormat('dd MMM, yyyy');
  static final mmyyyy = DateFormat('MM/yyyy');
}