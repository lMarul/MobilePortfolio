import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Utility to build the correct image widget for a URL that could be
/// either a network URL (http/https) or a local asset path.
class ImageUtils {
  /// Returns true if [url] is a network URL (starts with http:// or https://).
  static bool isNetworkUrl(String url) {
    return url.startsWith('http://') || url.startsWith('https://');
  }

  /// Builds the appropriate image widget based on [imageUrl].
  /// - Network URLs → CachedNetworkImage
  /// - Asset paths   → Image.asset
  static Widget buildImage({
    required String imageUrl,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    final defaultPlaceholder = placeholder ?? Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.primaryRed.withValues(alpha: 0.2),
          AppColors.darkRed.withValues(alpha: 0.2),
        ]),
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primaryRed.withValues(alpha: 0.5),
        ),
      ),
    );

    final defaultError = errorWidget ?? Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.primaryRed.withValues(alpha: 0.2),
          AppColors.darkRed.withValues(alpha: 0.2),
        ]),
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 28,
          color: Colors.white.withValues(alpha: 0.3),
        ),
      ),
    );

    if (imageUrl.isEmpty) {
      return defaultError;
    }

    if (isNetworkUrl(imageUrl)) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        placeholder: (context, url) => defaultPlaceholder,
        errorWidget: (context, url, error) => defaultError,
      );
    } else {
      // Local asset path - use full path as declared in pubspec.yaml
      return Image.asset(
        imageUrl,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => defaultError,
      );
    }
  }
}
