import 'package:flutter/painting.dart' show Alignment, Color, LinearGradient;

class AppColors {
  static final Color primary = Color(0xFF5738FD);
  static final Color textColor = Color(0xFF241069);
  static final Color subTextColor = Color(0xFF9882D5);
  static final LinearGradient gradient = LinearGradient(
    colors: [
      Color(0xFFAE52FF),
      Color(0xFF4C65F6),
      Color(0xFF3981E9),
      Color(0xFFAE52FF),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
