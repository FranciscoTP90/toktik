import 'package:intl/intl.dart';

class HumanFormat {
  static String humanReadbleNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      symbol: '',
      decimalDigits: 0,
    ).format(number);

    return formatterNumber;
  }
}
