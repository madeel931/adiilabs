import 'package:flutter/material.dart';
import '../../core/constants/brand_colors.dart';

class SectionHeader extends StatelessWidget {
  final String? eyebrow;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  const SectionHeader({
    super.key,
    this.eyebrow,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        if (eyebrow != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: BrandColors.primary.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              eyebrow!.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: BrandColors.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        Text(
          title,
          style: theme.textTheme.displayMedium?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: isDark
                ? BrandColors.textMain
                : BrandColors.textMainLight,
          ),
          textAlign: alignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(
            subtitle!,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isDark
                  ? BrandColors.textSecondary
                  : BrandColors.textSecondaryLight,
              fontSize: 16,
              height: 1.6,
            ),
            textAlign: alignment == CrossAxisAlignment.center
                ? TextAlign.center
                : TextAlign.start,
          ),
        ],
      ],
    );
  }
}
