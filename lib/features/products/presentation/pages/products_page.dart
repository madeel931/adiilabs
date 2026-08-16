import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../shared/models/product_model.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../cubit/products_cubit.dart';
import '../../cubit/products_state.dart';

class ProductsPage extends StatelessWidget {
  final Function(String route) onNavigate;

  const ProductsPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final isMobile = ResponsiveLayout.isMobile(context);

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final products = state.filteredProducts;

        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeader(
                  eyebrow: 'Studio Catalog',
                  title: 'Products',
                  subtitle: 'Software built to solve real problems.',
                ),
                const SizedBox(height: 48),

                // Product Cards Grid
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _ProductCard(
                      product: product,
                      isMobile: isMobile,
                      isDark: isDark,
                      theme: theme,
                      onNavigate: onNavigate,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isMobile;
  final bool isDark;
  final ThemeData theme;
  final Function(String route) onNavigate;

  const _ProductCard({
    required this.product,
    required this.isMobile,
    required this.isDark,
    required this.theme,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: product.isAvailable
              ? BrandColors.electricBlue.withValues(alpha: 0.4)
              : (isDark ? BrandColors.borderDark : BrandColors.borderLight),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon or placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: product.isAvailable
                      ? BrandColors.electricBlue.withValues(alpha: 0.15)
                      : (isDark
                            ? BrandColors.cardDark
                            : BrandColors.surfaceLight),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: product.isAvailable
                        ? BrandColors.electricBlue.withValues(alpha: 0.3)
                        : (isDark
                              ? BrandColors.borderDark
                              : BrandColors.borderLight),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: product.iconAsset.isNotEmpty
                        ? Image.asset(
                            product.iconAsset,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.dashboard_customize_rounded,
                                  color: BrandColors.electricBlue,
                                ),
                          )
                        : Icon(
                            Icons.hourglass_empty_rounded,
                            color: isDark
                                ? BrandColors.textDarkSecondary
                                : BrandColors.textLightSecondary,
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
                            fontSize: isMobile ? 20 : 22,
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
                            color: product.isAvailable
                                ? BrandColors.badgeGreenBg
                                : BrandColors.badgeBlueBg,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            product.isAvailable ? 'AVAILABLE' : 'COMING SOON',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: product.isAvailable
                                  ? BrandColors.badgeGreenText
                                  : BrandColors.badgeBlueText,
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
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          if (product.isAvailable)
            PrimaryButton(
              label: 'Explore ${product.name}',
              icon: Icons.arrow_forward_rounded,
              onPressed: () => onNavigate('/products/${product.slug}'),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.deepNavy : BrandColors.surfaceLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark
                      ? BrandColors.borderDark
                      : BrandColors.borderLight,
                ),
              ),
              child: Text(
                'In Active Studio Development',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? BrandColors.textDarkSecondary
                      : BrandColors.textLightSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
