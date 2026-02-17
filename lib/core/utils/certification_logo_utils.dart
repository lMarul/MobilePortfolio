import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

/// Maps certification issuers, icon types, and title keywords to appropriate icons.
class CertificationLogoUtils {
  /// Checks if a certification is Python-related and should use the Python logo.
  static bool isPythonCertification(String title) {
    return title.toLowerCase().contains('python');
  }

  /// Returns an appropriate icon for a certification based on its properties.
  static IconData getCertificationIcon({
    required String title,
    required String issuer,
    required String iconType,
  }) {
    final titleLower = title.toLowerCase();
    final issuerLower = issuer.toLowerCase();
    final iconLower = iconType.toLowerCase();

    // Match by specific topic/title keywords first
    // SQL / MySQL / Database
    if (titleLower.contains('sql') || 
        titleLower.contains('mysql') || 
        titleLower.contains('database') ||
        titleLower.contains('data modeling')) {
      return Icons.storage_rounded;
    }

    // Microsoft Teams
    if (titleLower.contains('microsoft teams') || 
        titleLower.contains('teams')) {
      return Icons.groups_rounded;
    }

    // Microsoft general
    if (titleLower.contains('microsoft') || 
        issuerLower.contains('microsoft')) {
      return Icons.window_rounded;
    }

    // Java
    if (titleLower.contains('java')) {
      return Icons.coffee_rounded;
    }

    // Python
    if (titleLower.contains('python')) {
      return Icons.code_rounded;
    }

    // Flutter / Dart
    if (titleLower.contains('flutter') || titleLower.contains('dart')) {
      return Icons.flutter_dash_rounded;
    }

    // Networking / CompTIA
    if (titleLower.contains('network') || titleLower.contains('comptia')) {
      return Icons.lan_rounded;
    }

    // Data Structures / Algorithms
    if (titleLower.contains('data structure') || 
        titleLower.contains('algorithm') ||
        titleLower.contains('recursion') ||
        titleLower.contains('linked list') ||
        titleLower.contains('trees') ||
        titleLower.contains('stacks') ||
        titleLower.contains('queues')) {
      return Icons.account_tree_rounded;
    }

    // Statistics / Math
    if (titleLower.contains('statistics') || titleLower.contains('math')) {
      return Icons.bar_chart_rounded;
    }

    // SAP / ERP
    if (titleLower.contains('sap') || titleLower.contains('erp')) {
      return Icons.business_rounded;
    }

    // System Administration / Backup
    if (titleLower.contains('system admin') || 
        titleLower.contains('backup') ||
        titleLower.contains('recovery')) {
      return Icons.settings_backup_restore_rounded;
    }

    // Computer Science
    if (titleLower.contains('computer science') || 
        titleLower.contains('digital information')) {
      return Icons.computer_rounded;
    }

    // Match by icon type / issuer
    if (iconLower == 'linkedin' || issuerLower.contains('linkedin')) {
      return LucideIcons.linkedin;
    }

    if (iconLower == 'google' || issuerLower.contains('google')) {
      return Icons.g_mobiledata_rounded;
    }

    if (iconLower == 'aws' || issuerLower.contains('amazon')) {
      return Icons.cloud_rounded;
    }

    // Default
    return Icons.verified_rounded;
  }
}
