import 'package:flutter/material.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/constants/brand_config.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/utils/url_launcher_utils.dart';
import '../../../../shared/models/product_model.dart';
import '../../../../shared/widgets/app_buttons.dart';

class HomePage extends StatelessWidget {
  final Function(String route) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ResponsiveLayout.maxContentWidth),
        child: Padding(
          padding: ResponsiveLayout.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HERO SECTION
              _buildHeroSection(context, isDark, theme),
              const SizedBox(height: 120),

              // 2. FEATURED PRODUCT SECTION
              _buildFeaturedProductSection(context, isDark, theme),
              const SizedBox(height: 120),

              // 3. PRODUCT CAPABILITIES
              _buildCapabilitiesSection(context, isDark, theme),
              const SizedBox(height: 120),

              // 4. PHILOSOPHY SECTION
              _buildPhilosophySection(context, isDark, theme),
              const SizedBox(height: 120),

              // 5. BUILDING IN PUBLIC & TECHNICAL CREDIBILITY
              _buildBuildInPublicAndTech(context, isDark, theme),
              const SizedBox(height: 120),

              // 6. FUTURE PRODUCTS & ABOUT
              _buildFutureAndAbout(context, isDark, theme),
              const SizedBox(height: 120),

              // 7. CONTACT
              _buildContactSection(context, isDark, theme),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Eyebrow
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: BrandColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: BrandColors.primary.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: Text(
            'INDEPENDENT SOFTWARE STUDIO',
            style: theme.textTheme.labelLarge?.copyWith(
              color: BrandColors.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Headline
        Text(
          'Build. Ship. Improve.',
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: isMobile ? 48 : 88,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 24),

        // Supporting Text
        Text(
          'Software products built with Flutter + AI.',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontSize: isMobile ? 24 : 32,
            color: isDark ? BrandColors.textSecondary : BrandColors.textSecondaryLight,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 48),

        // Hero Action CTAs
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            PrimaryButton(
              label: 'Explore InvoiceFlow Pro',
              onPressed: () => onNavigate('/products/invoiceflow-pro'),
            ),
            SecondaryButton(
              label: 'Follow the Build',
              onPressed: () => UrlLauncherUtils.launchURL(BrandConfig.xUrl),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeaturedProductSection(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final product = ProductsData.invoiceFlowPro;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '01 / FEATURED PRODUCT',
          style: theme.textTheme.labelLarge?.copyWith(
            color: isDark ? BrandColors.textSecondary : BrandColors.textSecondaryLight,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? BrandColors.border : BrandColors.borderLight,
              width: 1,
            ),
          ),
          padding: EdgeInsets.all(isMobile ? 24 : 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: BrandColors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          product.iconAsset,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: theme.textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Offline-first invoicing for small businesses.',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: BrandColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                product.description,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                label: 'View Product Details',
                onPressed: () => onNavigate('/products/invoiceflow-pro'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCapabilitiesSection(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Built to be useful.',
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: 32),
        GridView.count(
          crossAxisCount: isMobile ? 1 : 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: isMobile ? 2.5 : 1.5,
          children: const [
            _FeatureGridItem(
              title: 'Offline First',
              description: 'Works seamlessly without an internet connection.',
            ),
            _FeatureGridItem(
              title: 'Local Storage',
              description: 'All your data stays securely on your device.',
            ),
            _FeatureGridItem(
              title: 'Cross Platform',
              description: 'Available on Web, Android, and Desktop.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhilosophySection(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "We don't build demos.\nWe build software that ships.",
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: 48),
        GridView.count(
          crossAxisCount: isMobile ? 1 : 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: isMobile ? 1.8 : 1,
          children: const [
            _PhilosophyCard(
              title: 'BUILD',
              description: 'Robust, offline-capable architecture using modern Flutter.',
            ),
            _PhilosophyCard(
              title: 'SHIP',
              description: 'Moving quickly from concept to production-ready products.',
            ),
            _PhilosophyCard(
              title: 'IMPROVE',
              description: 'Iterating rapidly based on user feedback and real-world usage.',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBuildInPublicAndTech(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isMobile ? 0 : 2,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Building in Public',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  'Follow the journey of building ADii Labs. I share development logs, design decisions, and lessons learned along the way.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                SecondaryButton(
                  label: 'Follow on X',
                  onPressed: () => UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                ),
              ],
            ),
          ),
        ),
        if (isMobile) const SizedBox(height: 24) else const SizedBox(width: 24),
        Expanded(
          flex: isMobile ? 0 : 1,
          child: Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDark ? BrandColors.border : BrandColors.borderLight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Powered By',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: BrandColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                const _TechItem(label: 'Flutter 3+'),
                const _TechItem(label: 'Dart'),
                const _TechItem(label: 'Material 3'),
                const _TechItem(label: 'Offline-First'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFutureAndAbout(BuildContext context, bool isDark, ThemeData theme) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About ADii Labs', style: theme.textTheme.headlineMedium),
              const SizedBox(height: 24),
              Text(
                'ADii Labs is an independent software studio founded by Adeel. We focus on building high-quality, practical tools that solve real problems. Everything here is designed, engineered, and shipped by a single developer with the help of AI.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              SecondaryButton(
                label: 'Read More',
                onPressed: () => onNavigate('/about'),
              ),
            ],
          ),
        ),
        if (isMobile) const SizedBox(height: 48) else const SizedBox(width: 64),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              border: Border.all(
                color: isDark ? BrandColors.border : BrandColors.borderLight,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'IN DEVELOPMENT',
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'More products are being built.',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'We are actively exploring new ideas in the AI and productivity space.',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection(BuildContext context, bool isDark, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's build something useful.",
          style: theme.textTheme.headlineLarge,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            PrimaryButton(
              label: 'Get in Touch',
              onPressed: () => UrlLauncherUtils.launchURL('mailto:engineer.adeel.pk@gmail.com'),
            ),
            SecondaryButton(
              label: 'X (Twitter)',
              onPressed: () => UrlLauncherUtils.launchURL(BrandConfig.xUrl),
            ),
            SecondaryButton(
              label: 'GitHub',
              onPressed: () => UrlLauncherUtils.launchURL(BrandConfig.githubUrl),
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureGridItem extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureGridItem({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
        border: Border.all(
          color: isDark ? BrandColors.border : BrandColors.borderLight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(description, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _PhilosophyCard extends StatelessWidget {
  final String title;
  final String description;

  const _PhilosophyCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: BrandColors.primary,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          Text(description, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _TechItem extends StatelessWidget {
  final String label;

  const _TechItem({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: BrandColors.primary, size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isDark ? BrandColors.textMain : BrandColors.textMainLight,
            ),
          ),
        ],
      ),
    );
  }
}
