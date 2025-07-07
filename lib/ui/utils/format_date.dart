import 'package:intl/intl.dart';

class FormatDate {
  static String format(DateTime fecha) {
    final formatted = DateFormat("MMMM dd, yyyy", 'es').format(fecha);
    return formatted[0].toUpperCase() + formatted.substring(1); // Capitaliza la primera letra
  }
}
