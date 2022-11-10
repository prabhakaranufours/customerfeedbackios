import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor.trim().isEmpty) hexColor = "FF000000";
    hexColor = hexColor.toUpperCase().replaceAll("#", "").trim();
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    } else {
      hexColor = "FF000000";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
