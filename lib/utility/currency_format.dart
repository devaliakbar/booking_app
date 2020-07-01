import 'package:easy_localization/easy_localization.dart';

convertToCurrency(String value, {String currencyType}) {
  if (currencyType == null) {
    currencyType = "en_US";
  }
  double currency = double.parse(value);
  return NumberFormat.currency(locale: currencyType).format(currency);
}
