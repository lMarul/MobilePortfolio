import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// 🔧 DART & FLUTTER EXTENSIONS
/// ═══════════════════════════════════════════════════════════════════════════
/// Quality-of-life extensions for cleaner code.

// ═══════════════════════════════════════════════════════════════════════════
// 📐 CONTEXT EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

extension ContextX on BuildContext {
  /// Screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Screen width
  double get screenWidth => screenSize.width;

  /// Screen height
  double get screenHeight => screenSize.height;

  /// Theme data
  ThemeData get theme => Theme.of(this);

  /// Color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Text theme
  TextTheme get textTheme => theme.textTheme;

  /// Is dark mode
  bool get isDark => theme.brightness == Brightness.dark;

  /// Is light mode
  bool get isLight => !isDark;

  /// Safe area padding
  EdgeInsets get safeArea => MediaQuery.paddingOf(this);

  /// Keyboard is visible
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}

// ═══════════════════════════════════════════════════════════════════════════
// 🎨 COLOR EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

extension ColorX on Color {
  /// Create a color with modified opacity
  Color withOpacity(double opacity) => Color.fromARGB(
    (opacity * 255).round(),
    r.toInt(),
    g.toInt(),
    b.toInt(),
  );

  /// Darken the color
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final darkened = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }

  /// Lighten the color
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightened = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return lightened.toColor();
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 📏 NUM EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

extension NumX on num {
  /// Convert to SizedBox with height
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  /// Convert to SizedBox with width
  SizedBox get horizontalSpace => SizedBox(width: toDouble());

  // NOTE: Duration extensions (.ms, .seconds) are provided by flutter_animate
  // Import 'package:flutter_animate/flutter_animate.dart' to use them
}

// ═══════════════════════════════════════════════════════════════════════════
// 📝 STRING EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

extension StringX on String {
  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Title case
  String get titleCase {
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if string is a valid URL
  bool get isValidUrl {
    return Uri.tryParse(this)?.hasAbsolutePath ?? false;
  }

  /// Check if string is a valid email
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 📅 DATETIME EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

extension DateTimeX on DateTime {
  /// Format as "Jan 2024"
  String get monthYear {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[month - 1]} $year';
  }

  /// Format as "January 2024"
  String get fullMonthYear {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[month - 1]} $year';
  }

  /// Time ago string
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// 📋 LIST EXTENSIONS
// ═══════════════════════════════════════════════════════════════════════════

extension ListX<T> on List<T> {
  /// Get element at index or null
  T? getOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Separate items with a separator widget (for Columns/Rows)
  List<Widget> separatedBy(Widget separator) {
    if (isEmpty) return [];

    final widgets = this as List<Widget>;
    final result = <Widget>[];

    for (var i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i < widgets.length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}
