import 'package:flutter/material.dart';
import '../../core/constants/brand_colors.dart';
import '../../core/constants/brand_config.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/utils/url_launcher_utils.dart';
import '../../core/constants/asset_paths.dart';

class Footer extends StatelessWidget {
  final Function(String route) onNavigate;

  const Footer({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? BrandColors.surface : BrandColors.surfaceLight,
        border: Border(
          top: BorderSide(
            color: isDark ? BrandColors.border : BrandColors.borderLight,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              if (ResponsiveLayout.isDesktop(context))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand Info Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                width: 28,
                                height: 28,
                                color: BrandColors.primary,
                                child: Image.asset(
                                  AssetPaths.studioLogo,
                                  width: 28,
                                  height: 28,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(
                                        child: Text(
                                          'A',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              BrandConfig.brandName,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          BrandConfig.tagline,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? BrandColors.textSecondary
                                : BrandColors.textSecondaryLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          BrandConfig.positioning,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? BrandColors.textSecondary
                                : BrandColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),

                    // Quick Navigation Links
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _FooterNavColumn(
                          title: 'Pages',
                          items: [
                            _FooterItem(
                              label: 'Products',
                              onTap: () => onNavigate('/products'),
                            ),
                            _FooterItem(
                              label: 'InvoiceFlow Pro',
                              onTap: () =>
                                  onNavigate('/products/invoiceflow-pro'),
                            ),
                            _FooterItem(
                              label: 'About Studio',
                              onTap: () => onNavigate('/about'),
                            ),
                            _FooterItem(
                              label: 'Contact',
                              onTap: () => onNavigate('/contact'),
                            ),
                          ],
                        ),
                        const SizedBox(width: 48),
                        _FooterNavColumn(
                          title: 'Connect',
                          items: [
                            _FooterItem(
                              label: 'X (Twitter)',
                              onTap: () =>
                                  UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                              isExternal: true,
                            ),
                            _FooterItem(
                              label: 'GitHub',
                              onTap: () => UrlLauncherUtils.launchURL(
                                BrandConfig.githubUrl,
                              ),
                              isExternal: true,
                            ),
                            _FooterItem(
                              label: 'Building in Public',
                              onTap: () =>
                                  UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                              isExternal: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              else
                // Mobile Vertical Layout
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            width: 28,
                            height: 28,
                            color: BrandColors.primary,
                            child: Image.asset(
                              AssetPaths.studioLogo,
                              width: 28,
                              height: 28,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          BrandConfig.brandName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      BrandConfig.tagline,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? BrandColors.textSecondary
                            : BrandColors.textSecondaryLight,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        _FooterLinkText(
                          label: 'Products',
                          onTap: () => onNavigate('/products'),
                        ),
                        _FooterLinkText(
                          label: 'About',
                          onTap: () => onNavigate('/about'),
                        ),
                        _FooterLinkText(
                          label: 'Contact',
                          onTap: () => onNavigate('/contact'),
                        ),
                        _FooterLinkText(
                          label: 'X',
                          onTap: () =>
                              UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                        ),
                        _FooterLinkText(
                          label: 'GitHub',
                          onTap: () =>
                              UrlLauncherUtils.launchURL(BrandConfig.githubUrl),
                        ),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 40),
              Divider(
                color: isDark
                    ? BrandColors.border
                    : BrandColors.borderLight,
              ),
              const SizedBox(height: 24),

              // Bottom Copyright
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© ${BrandConfig.currentYear} ${BrandConfig.brandName}. All rights reserved.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight,
                    ),
                  ),
                  Text(
                    'Flutter + AI',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: BrandColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterNavColumn extends StatelessWidget {
  final String title;
  final List<_FooterItem> items;

  const _FooterNavColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: isDark
                ? BrandColors.textMain
                : BrandColors.textMainLight,
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: _FooterLinkText(
              label: item.label,
              onTap: item.onTap,
              isExternal: item.isExternal,
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterItem {
  final String label;
  final VoidCallback onTap;
  final bool isExternal;

  const _FooterItem({
    required this.label,
    required this.onTap,
    this.isExternal = false,
  });
}

class _FooterLinkText extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isExternal;

  const _FooterLinkText({
    required this.label,
    required this.onTap,
    this.isExternal = false,
  });

  @override
  State<_FooterLinkText> createState() => _FooterLinkTextState();
}

class _FooterLinkTextState extends State<_FooterLinkText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: _isHovered
                    ? BrandColors.primary
                    : (isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight),
              ),
            ),
            if (widget.isExternal) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.north_east_rounded,
                size: 11,
                color: _isHovered
                    ? BrandColors.primary
                    : (isDark
                          ? BrandColors.textSecondary
                          : BrandColors.textSecondaryLight),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
