import 'package:flutter/material.dart';

import '../theme/theme.dart';

class AppBadge extends StatelessWidget {
  final AppColorVariant variant;
  final String label;
  final double bgOpacity;

  const AppBadge({
    Key? key,
    required this.label,
    this.bgOpacity = 1.0,
    this.variant = AppColorVariant.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.appVariantToColor(context, variant, bgOpacity),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
