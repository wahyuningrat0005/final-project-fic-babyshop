import 'package:intl/intl.dart';

extension StringExt on int {
  String get currencyFormatUsd => NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
      ).format(this);
}
