import 'package:flutter/material.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/constants/brand_config.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/utils/url_launcher_utils.dart';
import '../../../../shared/models/product_model.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/section_header.dart';

import '../../../products/presentation/widgets/interactive_demo_widget.dart';
import '../../../../shared/widgets/newsletter_signup_widget.dart';

class HomePage extends StatelessWidget {
  final Function(String route) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            // 1. HERO SECTION
            _buildHeroSection(context, isDark, theme),
            const SizedBox(height: 80),

            // 2. FEATURED PRODUCT SECTION (InvoiceFlow Pro)
            _buildFeaturedProductSection(context, isDark, theme),
            const SizedBox(height: 80),

            // 3. LIVE INTERACTIVE DEMO WIDGET
            const InteractiveDemoWidget(),
            const SizedBox(height: 96),

            // 4. STUDIO PHILOSOPHY SECTION
            _buildPhilosophySection(context, isDark, theme),
            const SizedBox(height: 96),

            // 5. NEWSLETTER SIGNUP
            const NewsletterSignupWidget(),
            const SizedBox(height: 80),

            // 6. BUILDING IN PUBLIC BANNER
            _buildBuildInPublicBanner(context, isDark, theme),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Eyebrow
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: BrandColors.electricBlue.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: BrandColors.electricBlue.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: BrandColors.electricBlue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'ADII LABS',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: BrandColors.electricBlue,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Headline
        Text(
          BrandConfig.tagline,
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: isMobile ? 38 : 56,
            fontWeight: FontWeight.w800,
            color: isDark
                ? BrandColors.textDarkPrimary
                : BrandColors.textLightPrimary,
            letterSpacing: -1.5,
            height: 1.1,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),

        // Supporting Text
        Text(
          BrandConfig.positioning,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: isMobile ? 20 : 26,
            fontWeight: FontWeight.w600,
            color: BrandColors.electricBlue,
            height: 1.3,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),

        // Description Paragraph
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Text(
            BrandConfig.studioDescription,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: isMobile ? 16 : 18,
              color: isDark
                  ? BrandColors.textDarkSecondary
                  : BrandColors.textLightSecondary,
              height: 1.6,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 36),

        // Hero Action CTAs
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            PrimaryButton(
              label: 'Explore Products',
              icon: Icons.arrow_forward_rounded,
              onPressed: () => onNavigate('/products'),
            ),
            SecondaryButton(
              label: 'Follow the Build',
              icon: Icons.alternate_email_rounded,
              onPressed: () => UrlLauncherUtils.launchURL(BrandConfig.xUrl),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedProductSection(
    BuildContext context,
    bool isDark,
    ThemeData theme,
  ) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final product = ProductsData.invoiceFlowPro;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Featured Product',
          title: 'InvoiceFlow Pro',
          subtitle: 'Offline-first invoicing for small businesses.',
        ),
        const SizedBox(height: 32),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? BrandColors.borderDark : BrandColors.borderLight,
              width: 1.5,
            ),
          ),
          padding: EdgeInsets.all(isMobile ? 24 : 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product App Icon
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: isDark
                          ? BrandColors.cardDark
                          : BrandColors.surfaceLight,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: BrandColors.electricBlue.withValues(alpha: 0.3),
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          product.iconAsset,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.receipt_long_rounded,
                                color: BrandColors.electricBlue,
                                size: 28,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              product.name,
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: isMobile ? 20 : 24,
                                color: isDark
                                    ? BrandColors.textDarkPrimary
                                    : BrandColors.textLightPrimary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: BrandColors.badgeGreenBg,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'AVAILABLE',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: BrandColors.badgeGreenText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.tagline,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: BrandColors.electricBlue,
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
                product.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: isDark
                      ? BrandColors.textDarkSecondary
                      : BrandColors.textLightSecondary,
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),

              // Feature Tags
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: product.trustSpecs
                    .map(
                      (spec) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? BrandColors.deepNavy
                              : BrandColors.surfaceLight,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isDark
                                ? BrandColors.borderDark
                                : BrandColors.borderLight,
                          ),
                        ),
                        child: Text(
                          spec,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? BrandColors.textDarkPrimary
                                : BrandColors.textLightPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),

              // CTAs (PRD Section 13: Hide purchase button if URL does not exist yet)
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  PrimaryButton(
                    label: 'Explore InvoiceFlow Pro',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () => onNavigate('/products/invoiceflow-pro'),
                  ),
                  if (product.repositoryUrl != null)
                    SecondaryButton(
                      label: 'View on GitHub',
                      icon: Icons.code_rounded,
                      onPressed: () =>
                          UrlLauncherUtils.launchURL(product.repositoryUrl!),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhilosophySection(
    BuildContext context,
    bool isDark,
    ThemeData theme,
  ) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Studio Philosophy',
          title: 'How ADii Labs Builds',
          subtitle:
              'A developer-first approach focused on utility, performance, and long-term sustainability.',
        ),
        const SizedBox(height: 32),
        GridView.count(
          crossAxisCount: isMobile ? 1 : 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: isMobile ? 1.8 : 1.1,
          children: const [
            _PhilosophyCard(
              icon: Icons.architecture_rounded,
              title: 'Build.',
              description:
                  'Craft robust cross-platform software with Flutter and native local storage. Prioritize offline reliability and clean architecture over bloated dependencies.',
            ),
            _PhilosophyCard(
              icon: Icons.rocket_launch_rounded,
              title: 'Ship.',
              description:
                  'Move efficiently from concept to production using modern AI-assisted workflows. Focus on tangible products that users can run anywhere.',
            ),
            _PhilosophyCard(
              icon: Icons.sync_rounded,
              title: 'Improve.',
              description:
                  'Iterate based on real user feedback, performance benchmarks, and localized customer needs across mobile, tablet, and desktop.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBuildInPublicBanner(
    BuildContext context,
    bool isDark,
    ThemeData theme,
  ) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: BrandColors.electricBlue.withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.alternate_email_rounded,
                color: BrandColors.electricBlue,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'Building in Public',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 22 : 28,
                  color: isDark
                      ? BrandColors.textDarkPrimary
                      : BrandColors.textLightPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Follow the development process, technical lessons, product decisions, failures, fixes, and launches behind ADii Labs.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isDark
                  ? BrandColors.textDarkSecondary
                  : BrandColors.textLightSecondary,
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Follow ${BrandConfig.xHandle}',
            icon: Icons.open_in_new_rounded,
            onPressed: () => UrlLauncherUtils.launchURL(BrandConfig.xUrl),
          ),
        ],
      ),
    );
  }
}

class _PhilosophyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _PhilosophyCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? BrandColors.borderDark : BrandColors.borderLight,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BrandColors.electricBlue.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: BrandColors.electricBlue, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: isDark
                  ? BrandColors.textDarkPrimary
                  : BrandColors.textLightPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? BrandColors.textDarkSecondary
                    : BrandColors.textLightSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
