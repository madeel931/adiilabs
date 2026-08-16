import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../cubit/blog_cubit.dart';
import '../../cubit/blog_state.dart';
import '../../models/article_model.dart';

class BlogPage extends StatelessWidget {
  final Function(String route) onNavigate;

  const BlogPage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return BlocBuilder<BlogCubit, BlogState>(
      builder: (context, state) {
        final cubit = context.read<BlogCubit>();
        final activeArticle = state.activeArticle;
        final articles = state.filteredArticles;

        if (activeArticle != null) {
          return _buildArticleReader(
            context,
            isDark,
            isMobile,
            theme,
            activeArticle,
            cubit,
          );
        }

        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeader(
                  eyebrow: 'Studio Dev Logs',
                  title: 'Engineering & Public Building',
                  subtitle:
                      'Insights on Flutter, offline-first architecture, AI-assisted development, and studio product releases.',
                ),
                const SizedBox(height: 48),

                // Category Filter Chips
                Row(
                  children: [
                    _filterChip(cubit, state, null, 'All Articles'),
                    const SizedBox(width: 8),
                    _filterChip(cubit, state, 'Architecture', 'Architecture'),
                    const SizedBox(width: 8),
                    _filterChip(cubit, state, 'Development', 'Development'),
                    const SizedBox(width: 8),
                    _filterChip(cubit, state, 'Localization', 'Localization'),
                  ],
                ),
                const SizedBox(height: 32),

                // Articles List
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: articles.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => cubit.openArticle(article),
                        child: Container(
                          padding: EdgeInsets.all(isMobile ? 20 : 28),
                          decoration: BoxDecoration(
                            color: isDark
                                ? BrandColors.surfaceDark
                                : BrandColors.cardLight,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isDark
                                  ? BrandColors.borderDark
                                  : BrandColors.borderLight,
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: BrandColors.electricBlue
                                          .withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      article.category.toUpperCase(),
                                      style: const TextStyle(
                                        color: BrandColors.electricBlue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${article.date} • ${article.readTime}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: isDark
                                          ? BrandColors.textDarkSecondary
                                          : BrandColors.textLightSecondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                article.title,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: isMobile ? 18 : 22,
                                  color: isDark
                                      ? BrandColors.textDarkPrimary
                                      : BrandColors.textLightPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                article.summary,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: isDark
                                      ? BrandColors.textDarkSecondary
                                      : BrandColors.textLightSecondary,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    'Read Full Article',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: BrandColors.electricBlue,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 16,
                                    color: BrandColors.electricBlue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Widget _filterChip(
    BlogCubit cubit,
    BlogState state,
    String? category,
    String label,
  ) {
    final isSelected = state.selectedCategory == category;
    return GestureDetector(
      onTap: () => cubit.selectCategory(category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? BrandColors.electricBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? BrandColors.electricBlue
                : BrandColors.mutedSlate,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? BrandColors.white : BrandColors.mutedSlate,
          ),
        ),
      ),
    );
  }

  Widget _buildArticleReader(
    BuildContext context,
    bool isDark,
    bool isMobile,
    ThemeData theme,
    ArticleModel article,
    BlogCubit cubit,
  ) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 900),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => cubit.closeArticle(),
              borderRadius: BorderRadius.circular(6),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 16,
                      color: BrandColors.electricBlue,
                    ),
                    SizedBox(width: 6),
                    Text(
                      'Back to All Articles',
                      style: TextStyle(
                        color: BrandColors.electricBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              article.title,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: isMobile ? 28 : 38,
                fontWeight: FontWeight.w800,
                color: isDark
                    ? BrandColors.textDarkPrimary
                    : BrandColors.textLightPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.person_outline_rounded,
                  size: 16,
                  color: BrandColors.electricBlue,
                ),
                const SizedBox(width: 6),
                Text(
                  article.authorName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '${article.date} • ${article.readTime}',
                  style: TextStyle(
                    color: isDark
                        ? BrandColors.mutedSlate
                        : BrandColors.textLightSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(isMobile ? 20 : 32),
              decoration: BoxDecoration(
                color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isDark
                      ? BrandColors.borderDark
                      : BrandColors.borderLight,
                ),
              ),
              child: Text(
                article.content,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  fontSize: 16,
                  color: isDark
                      ? BrandColors.textDarkSecondary
                      : BrandColors.textLightSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
