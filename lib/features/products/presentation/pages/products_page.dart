import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../shared/models/product_model.dart';
import '../../../../shared/widgets/app_buttons.dart';
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
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: ResponsiveLayout.maxContentWidth),
            child: Padding(
              padding: ResponsiveLayout.pagePadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Studio Catalog',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: isDark ? BrandColors.textSecondary : BrandColors.textSecondaryLight,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Products',
                    style: theme.textTheme.displayLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Software built to solve real problems.',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: BrandColors.primary,
                    ),
                  ),
                  const SizedBox(height: 64),

                  // Product Cards Grid
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 48),
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
      padding: EdgeInsets.all(isMobile ? 24 : 48),
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: product.isAvailable
              ? BrandColors.primary.withValues(alpha: 0.4)
              : (isDark ? BrandColors.border : BrandColors.borderLight),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon or placeholder
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: product.isAvailable
                      ? BrandColors.primary.withValues(alpha: 0.15)
                      : (isDark ? BrandColors.surface : BrandColors.surfaceLight),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: product.isAvailable
                        ? BrandColors.primary.withValues(alpha: 0.3)
                        : (isDark ? BrandColors.border : BrandColors.borderLight),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: product.iconAsset.isNotEmpty
                        ? Image.asset(
                            product.iconAsset,
                            fit: BoxFit.contain,
                          )
                        : Icon(
                            Icons.hourglass_empty_rounded,
                            color: isDark ? BrandColors.textSecondary : BrandColors.textSecondaryLight,
                          ),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.name,
                          style: theme.textTheme.headlineLarge,
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: product.isAvailable
                                ? (isDark ? BrandColors.primary.withValues(alpha: 0.2) : BrandColors.primarySoft.withValues(alpha: 0.2))
                                : (isDark ? BrandColors.surface : BrandColors.surfaceLight),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            product.isAvailable ? 'AVAILABLE' : 'IN DEVELOPMENT',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: product.isAvailable
                                  ? BrandColors.primary
                                  : (isDark ? BrandColors.textSecondary : BrandColors.textSecondaryLight),
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.tagline,
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
          if (product.isAvailable)
            PrimaryButton(
              label: 'View Product Details',
              onPressed: () => onNavigate('/products/${product.slug}'),
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.background : BrandColors.backgroundLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark ? BrandColors.border : BrandColors.borderLight,
                ),
              ),
              child: Text(
                'In Active Studio Development',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

