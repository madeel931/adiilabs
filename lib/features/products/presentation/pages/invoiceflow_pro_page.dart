import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/utils/url_launcher_utils.dart';
import '../../../../shared/models/product_model.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../cubit/invoiceflow_pro_cubit.dart';
import '../../cubit/invoiceflow_pro_state.dart';

import '../widgets/interactive_demo_widget.dart';

class InvoiceFlowProPage extends StatelessWidget {
  final Function(String route) onNavigate;

  const InvoiceFlowProPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);

    return BlocBuilder<InvoiceFlowProCubit, InvoiceFlowProState>(
      builder: (context, state) {
        final product = state.product;
        final selectedScreenshotIndex = state.selectedScreenshotIndex;

        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. PRODUCT HERO
                _buildProductHero(context, isDark, isMobile, theme, product),
                const SizedBox(height: 64),

                // 2. REAL PRODUCT SCREENSHOTS GALLERY
                _buildScreenshotsGallery(
                  context,
                  isDark,
                  isMobile,
                  theme,
                  product,
                  selectedScreenshotIndex,
                ),
                const SizedBox(height: 80),

                // 3. LIVE INTERACTIVE DEMO INVOICE GENERATOR
                const InteractiveDemoWidget(),
                const SizedBox(height: 80),

                // 4. PRODUCT FEATURES GRID
                _buildFeaturesGrid(context, isDark, isMobile, theme, product),
                const SizedBox(height: 80),

                // 5. TECHNICAL & PRODUCT TRUST SPECS
                _buildTrustSection(context, isDark, isMobile, theme, product),
                const SizedBox(height: 48),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductHero(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ThemeData theme,
    ProductModel product,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back link
        InkWell(
          onTap: () => onNavigate('/products'),
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back_rounded,
                  size: 16,
                  color: BrandColors.electricBlue,
                ),
                const SizedBox(width: 6),
                Text(
                  'Back to Products',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: BrandColors.electricBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: isDark ? BrandColors.cardDark : BrandColors.surfaceLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: BrandColors.electricBlue.withValues(alpha: 0.3),
                  width: 1.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    product.iconAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.receipt_long_rounded,
                      color: BrandColors.electricBlue,
                      size: 36,
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
                    product.name,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontSize: isMobile ? 32 : 44,
                      fontWeight: FontWeight.w800,
                      color: isDark
                          ? BrandColors.textDarkPrimary
                          : BrandColors.textLightPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.tagline,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.w600,
                      color: BrandColors.electricBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          product.description,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: isMobile ? 16 : 18,
            color: isDark
                ? BrandColors.textDarkSecondary
                : BrandColors.textLightSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          product.fullDescription,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 15,
            color: isDark
                ? BrandColors.textDarkSecondary
                : BrandColors.textLightSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),

        // CTAs: PRD Section 14: Only show "Get InvoiceFlow Pro" when purchase URL is available
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            if (product.purchaseUrl != null)
              PrimaryButton(
                label: 'Get InvoiceFlow Pro',
                icon: Icons.shopping_bag_rounded,
                onPressed: () =>
                    UrlLauncherUtils.launchURL(product.purchaseUrl!),
              ),
            if (product.repositoryUrl != null)
              SecondaryButton(
                label: 'View Project on GitHub',
                icon: Icons.code_rounded,
                onPressed: () =>
                    UrlLauncherUtils.launchURL(product.repositoryUrl!),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildScreenshotsGallery(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ThemeData theme,
    ProductModel product,
    int selectedScreenshotIndex,
  ) {
    final screenshots = product.screenshotAssets;
    final screenshotMetas = [
      const _ScreenshotMeta(
        title: 'Dashboard (Dark Mode)',
        label: 'Dark Mode',
        icon: Icons.dark_mode_rounded,
        urlPath: 'invoiceflow.pro/dashboard/dark',
        specs:
            'Material 3 Dark Theme • 100% Offline Local DB • Financial Summaries',
      ),
      const _ScreenshotMeta(
        title: 'Dashboard (Light Mode)',
        label: 'Light Mode',
        icon: Icons.light_mode_rounded,
        urlPath: 'invoiceflow.pro/dashboard/light',
        specs: 'Material 3 Light Theme • Adaptive Contrast • Responsive Layout',
      ),
      const _ScreenshotMeta(
        title: 'Arabic (RTL Layout)',
        label: 'Arabic RTL',
        icon: Icons.language_rounded,
        urlPath: 'invoiceflow.pro/l10n/ar',
        specs: 'Full RTL Support • Arabic Localization • Native Alignment',
      ),
      const _ScreenshotMeta(
        title: 'Urdu (RTL Layout)',
        label: 'Urdu RTL',
        icon: Icons.translate_rounded,
        urlPath: 'invoiceflow.pro/l10n/ur',
        specs: 'Urdu UI Translation • RTL Form Fields • Localized Formatting',
      ),
      const _ScreenshotMeta(
        title: 'Custom Currency (SAR)',
        label: 'SAR Currency',
        icon: Icons.payments_rounded,
        urlPath: 'invoiceflow.pro/settings/currency',
        specs:
            'Custom Currency Formats • Local SAR Symbol • Instant Calculation',
      ),
    ];

    final currentMeta = screenshotMetas[selectedScreenshotIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Product Interface',
          title: 'Screenshots & UI Showcase',
          subtitle:
              'Explore real application screens captured directly from InvoiceFlow Pro builds.',
        ),
        const SizedBox(height: 32),

        // Interactive Category Filter Tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(screenshotMetas.length, (index) {
              final meta = screenshotMetas[index];
              final isSelected = index == selectedScreenshotIndex;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context
                        .read<InvoiceFlowProCubit>()
                        .selectScreenshot(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? BrandColors.electricBlue
                            : (isDark
                                  ? BrandColors.surfaceDark
                                  : BrandColors.cardLight),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? BrandColors.electricBlue
                              : (isDark
                                    ? BrandColors.borderDark
                                    : BrandColors.borderLight),
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: BrandColors.electricBlue.withValues(
                                    alpha: 0.3,
                                  ),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            meta.icon,
                            size: 16,
                            color: isSelected
                                ? BrandColors.white
                                : (isDark
                                      ? BrandColors.textDarkSecondary
                                      : BrandColors.textLightSecondary),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            meta.label,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: 13,
                              color: isSelected
                                  ? BrandColors.white
                                  : (isDark
                                        ? BrandColors.textDarkPrimary
                                        : BrandColors.textLightPrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 24),

        // High-End macOS Window Frame Showcase Mockup
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? BrandColors.borderDark : BrandColors.borderLight,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: BrandColors.electricBlue.withValues(
                  alpha: isDark ? 0.12 : 0.06,
                ),
                blurRadius: 40,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Column(
            children: [
              // Window Header Bar with URL Address Box
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? BrandColors.deepNavy
                      : BrandColors.surfaceLight,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: isDark
                          ? BrandColors.borderDark
                          : BrandColors.borderLight,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    // Mac Window Controls
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF5F56),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFBD2E),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFF27C93F),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // URL Bar
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? BrandColors.surfaceDark
                              : BrandColors.cardLight,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isDark
                                ? BrandColors.borderDark
                                : BrandColors.borderLight,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.lock_rounded,
                              size: 12,
                              color: BrandColors.badgeGreenText,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                currentMeta.urlPath,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontFamily: 'monospace',
                                  fontSize: 12,
                                  color: isDark
                                      ? BrandColors.textDarkSecondary
                                      : BrandColors.textLightSecondary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Offline Status Badge
                    if (!isMobile)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: BrandColors.badgeGreenBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: BrandColors.badgeGreenText,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'OFFLINE-FIRST',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: BrandColors.badgeGreenText,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),

              // Showcase Content Area with Animated Switcher
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: isMobile ? 300 : 440,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                          child: Image.asset(
                            screenshots[selectedScreenshotIndex],
                            key: ValueKey<int>(selectedScreenshotIndex),
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 320,
                                color: isDark
                                    ? BrandColors.deepNavy
                                    : BrandColors.surfaceLight,
                                child: const Center(
                                  child: Text(
                                    'InvoiceFlow Pro Interface',
                                    style: TextStyle(
                                      color: BrandColors.mutedSlate,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Screenshot Feature Details Bar
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? BrandColors.deepNavy
                            : BrandColors.surfaceLight,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark
                              ? BrandColors.borderDark
                              : BrandColors.borderLight,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.info_outline_rounded,
                            size: 16,
                            color: BrandColors.electricBlue,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${currentMeta.title}: ${currentMeta.specs}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: isDark
                                    ? BrandColors.textDarkPrimary
                                    : BrandColors.textLightPrimary,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Interactive Thumbnail Strip
        SizedBox(
          height: 84,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: screenshots.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final isSelected = index == selectedScreenshotIndex;
              final meta = screenshotMetas[index];
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => context
                      .read<InvoiceFlowProCubit>()
                      .selectScreenshot(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? BrandColors.electricBlue
                            : (isDark
                                  ? BrandColors.borderDark
                                  : BrandColors.borderLight),
                        width: isSelected ? 2.5 : 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              screenshots[index],
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 4,
                            ),
                            color: Colors.black.withValues(alpha: 0.75),
                            child: Text(
                              meta.label,
                              style: const TextStyle(
                                color: BrandColors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ThemeData theme,
    ProductModel product,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          eyebrow: 'Capabilities',
          title: 'V1 Features',
          subtitle:
              'Core application capabilities engineered into InvoiceFlow Pro.',
        ),
        const SizedBox(height: 32),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile
                ? 1
                : (ResponsiveLayout.isTablet(context) ? 2 : 3),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: isMobile ? 2.0 : 1.35,
          ),
          itemCount: product.features.length,
          itemBuilder: (context, index) {
            final feature = product.features[index];
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? BrandColors.borderDark
                      : BrandColors.borderLight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: BrandColors.electricBlue.withValues(
                            alpha: 0.12,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.check_circle_outline_rounded,
                          color: BrandColors.electricBlue,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: isDark
                                ? BrandColors.textDarkPrimary
                                : BrandColors.textLightPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      feature.description,
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
          },
        ),
      ],
    );
  }

  Widget _buildTrustSection(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ThemeData theme,
    ProductModel product,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 36),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? BrandColors.borderDark : BrandColors.borderLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.verified_user_rounded,
                color: BrandColors.electricBlue,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'Verified Product Technical Specs',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 20 : 24,
                  color: isDark
                      ? BrandColors.textDarkPrimary
                      : BrandColors.textLightPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'All technical facts listed below have been verified directly against the production codebase of InvoiceFlow Pro.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? BrandColors.textDarkSecondary
                  : BrandColors.textLightSecondary,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: product.trustSpecs
                .map(
                  (spec) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? BrandColors.deepNavy
                          : BrandColors.surfaceLight,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDark
                            ? BrandColors.borderDark
                            : BrandColors.borderLight,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.verified_rounded,
                          size: 16,
                          color: BrandColors.electricBlue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          spec,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? BrandColors.textDarkPrimary
                                : BrandColors.textLightPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _ScreenshotMeta {
  final String title;
  final String label;
  final IconData icon;
  final String urlPath;
  final String specs;

  const _ScreenshotMeta({
    required this.title,
    required this.label,
    required this.icon,
    required this.urlPath,
    required this.specs,
  });
}
