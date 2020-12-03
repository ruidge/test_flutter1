import 'package:date_format/date_format.dart';

extension ObjectExtension on Object {
  String get timestamp {
    return formatDate(DateTime.now(), [HH, ':', nn, ':', ss, ':', SSS]);
  }
}
