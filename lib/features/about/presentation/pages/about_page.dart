import 'package:flutter/material.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/constants/brand_config.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/utils/url_launcher_utils.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/section_header.dart';

import '../../../../core/constants/asset_paths.dart';

class AboutPage extends StatelessWidget {
  final Function(String route) onNavigate;

  const AboutPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. HEADER
            const SectionHeader(
              eyebrow: 'Independent Studio',
              title: 'About ADii Labs',
              subtitle:
                  'ADii Labs is an independent software studio focused on building practical software products.',
            ),
            const SizedBox(height: 48),

            // 2. STUDIO MISSION & PHILOSOPHY
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 24 : 36),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? BrandColors.border
                      : BrandColors.borderLight,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Engineering Utility & Craft',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 22 : 28,
                      color: isDark
                          ? BrandColors.textMain
                          : BrandColors.textMainLight,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The studio uses Flutter and modern development tools, including AI-assisted development, to move from idea to shipped product efficiently.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight,
                      fontSize: 17,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The studio philosophy is simple: Build. Ship. Improve. Every product is engineered with clean architecture, offline capabilities, and direct user value.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight,
                      fontSize: 17,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),

            // 3. FOUNDER SECTION
            Text(
              'Studio Founder',
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: isDark
                    ? BrandColors.textMain
                    : BrandColors.textMainLight,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 24 : 36),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? BrandColors.border
                      : BrandColors.borderLight,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Founder Avatar Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 64,
                          height: 64,
                          color: BrandColors.primary,
                          child: Image.asset(
                            AssetPaths.founderAvatar,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Text(
                                    'MA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              BrandConfig.founderName,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: isMobile ? 22 : 26,
                                color: isDark
                                    ? BrandColors.textMain
                                    : BrandColors.textMainLight,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              BrandConfig.founderRole,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: BrandColors.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    BrandConfig.founderBio,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'Core Focus Areas',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: isDark
                          ? BrandColors.textMain
                          : BrandColors.textMainLight,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      _FocusTag(label: 'Flutter'),
                      _FocusTag(label: 'Mobile Applications'),
                      _FocusTag(label: 'AI-Assisted Development'),
                      _FocusTag(label: 'Product Development'),
                      _FocusTag(label: 'Developer Tools'),
                      _FocusTag(label: 'Building and Shipping Software'),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // CTAs
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      PrimaryButton(
                        label: 'Follow on X (${BrandConfig.xHandle})',
                        icon: Icons.open_in_new_rounded,
                        onPressed: () =>
                            UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                      ),
                      SecondaryButton(
                        label: 'View GitHub Profile',
                        icon: Icons.code_rounded,
                        onPressed: () =>
                            UrlLauncherUtils.launchURL(BrandConfig.githubUrl),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 64),

            // 4. BUILDING IN PUBLIC SECTION
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 24 : 36),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: BrandColors.primary.withValues(alpha: 0.4),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Building in Public',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 22 : 26,
                      color: isDark
                          ? BrandColors.textMain
                          : BrandColors.textMainLight,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Follow the development process, technical lessons, product decisions, failures, fixes, and launches behind ADii Labs.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: 'Follow ${BrandConfig.xHandle}',
                    icon: Icons.alternate_email_rounded,
                    onPressed: () =>
                        UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _FocusTag extends StatelessWidget {
  final String label;

  const _FocusTag({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? BrandColors.border : BrandColors.borderLight,
        ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isDark
              ? BrandColors.textMain
              : BrandColors.textMainLight,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}
