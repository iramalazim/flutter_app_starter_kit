import 'package:intl/intl.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class EStoreFormatter {
  static String formatDateAndTime(
    DateTime? date, {
    bool use24HourFormat = false,
  }) {
    date ??= DateTime.now();
    final onlyDate = DateFormat('dd/MM/yyyy').format(date);
    // 'hh:mm a' for 12-hour with AM/PM, or 'HH:mm' for 24-hour format.
    final timeFormat = use24HourFormat ? 'HH:mm' : 'hh:mm a';
    final onlyTime = DateFormat(timeFormat).format(date);
    return '$onlyDate at $onlyTime';
  }

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat(
      'dd-MMM-yyyy',
    ).format(date); // Can be Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '৳',
    ).format(amount); // Can Customized the currency locale and symbol as needed
  }

  static String formatCurrencyBDT(double amount) {
    return NumberFormat.currency(
      locale: 'bn_BD',
      symbol: '৳',
    ).format(amount); // Can Customized the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // 1. Sanitize the input by removing all non-digit characters
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Handle "+880..." format -> "01..."
    // e.g., +8801812345678 -> 01812345678
    if (phoneNumber.trim().startsWith('+880') && cleanNumber.length == 13) {
      return '0${cleanNumber.substring(3)}';
    }

    // Handle "880..." format -> "880..."
    // e.g., 880 1912-345-678 -> 8801912345678
    if (cleanNumber.startsWith('880') && cleanNumber.length == 13) {
      return cleanNumber;
    }

    // Handle "01..." format -> "01..."
    // e.g., 01712345678 -> 01712345678
    if (cleanNumber.startsWith('01') && cleanNumber.length == 11) {
      return cleanNumber;
    }

    // If the format is not recognized, return the original input
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }

  static String formatInternationalPhoneNumber(
    String isoCode,
    String phoneNumber,
  ) {
    try {
      IsoCode? iso;
      try {
        iso = IsoCode.values.byName(isoCode.toUpperCase());
      } catch (_) {
        iso = null;
      }

      final parsed = (iso != null)
          ? PhoneNumber.parse(phoneNumber, callerCountry: iso)
          : PhoneNumber.parse(phoneNumber);
      return parsed.international;
    } catch (e) {
      return phoneNumber;
    }
  }
}
