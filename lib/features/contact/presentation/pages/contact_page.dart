import 'package:flutter/material.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/constants/brand_config.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/utils/url_launcher_utils.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/section_header.dart';

import '../../../../core/constants/asset_paths.dart';

class ContactPage extends StatelessWidget {
  final Function(String route) onNavigate;

  const ContactPage({super.key, required this.onNavigate});

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
              eyebrow: 'Get In Touch',
              title: "Let's Build Something Useful",
              subtitle:
                  'Reach out to ADii Labs for inquiries, software feedback, product collaboration, or developer discussions.',
            ),
            const SizedBox(height: 48),

            // 2. OFFICIAL CONTACT CHANNELS CARD
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
                    'Official Studio Channels',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: isMobile ? 22 : 26,
                      color: isDark
                          ? BrandColors.textMain
                          : BrandColors.textMainLight,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Email Channel
                  _ContactChannelTile(
                    icon: Icons.email_rounded,
                    title: 'Direct Email',
                    subtitle: BrandConfig.contactEmail,
                    buttonLabel: 'Send Email',
                    onTap: () =>
                        UrlLauncherUtils.sendEmail(BrandConfig.contactEmail),
                    isDark: isDark,
                    theme: theme,
                  ),
                  const SizedBox(height: 16),

                  // X Channel
                  _ContactChannelTile(
                    icon: Icons.alternate_email_rounded,
                    title: 'X (Twitter)',
                    subtitle: BrandConfig.xHandle,
                    buttonLabel: 'Follow & Message',
                    onTap: () => UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                    isDark: isDark,
                    theme: theme,
                  ),
                  const SizedBox(height: 16),

                  // GitHub Channel
                  _ContactChannelTile(
                    icon: Icons.code_rounded,
                    title: 'GitHub',
                    subtitle: 'Explore ADii Labs repositories and open code',
                    buttonLabel: 'View GitHub',
                    onTap: () =>
                        UrlLauncherUtils.launchURL(BrandConfig.githubUrl),
                    isDark: isDark,
                    theme: theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),

            // 3. FOUNDER PROFILE CARD
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 20 : 28),
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
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 56,
                      height: 56,
                      color: BrandColors.primary,
                      child: Image.asset(
                        AssetPaths.founderAvatar,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              AssetPaths.studioLogo,
                              width: 56,
                              height: 56,
                              fit: BoxFit.contain,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          BrandConfig.founderName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: isDark
                                ? BrandColors.textMain
                                : BrandColors.textMainLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          BrandConfig.founderRole,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: BrandColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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

class _ContactChannelTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final VoidCallback onTap;
  final bool isDark;
  final ThemeData theme;

  const _ContactChannelTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.onTap,
    required this.isDark,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? BrandColors.border : BrandColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: BrandColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: isDark
                        ? BrandColors.textMain
                        : BrandColors.textMainLight,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark
                        ? BrandColors.textSecondary
                        : BrandColors.textSecondaryLight,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 16),
            SecondaryButton(label: buttonLabel, onPressed: onTap),
          ],
        ],
      ),
    );
  }
}
