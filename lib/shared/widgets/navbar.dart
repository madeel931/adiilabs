import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/brand_colors.dart';
import '../../core/constants/brand_config.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/cubit/theme_cubit.dart';
import '../../core/utils/url_launcher_utils.dart';
import 'app_buttons.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentRoute;
  final Function(String route) onNavigate;

  const NavBar({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: (isDark ? BrandColors.deepNavy : BrandColors.surfaceLight)
            .withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: isDark ? BrandColors.borderDark : BrandColors.borderLight,
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () => onNavigate('/'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: BrandColors.electricBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              color: BrandColors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        BrandConfig.brandName,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          letterSpacing: -0.5,
                          color: isDark
                              ? BrandColors.textDarkPrimary
                              : BrandColors.textLightPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Desktop Menu
              if (ResponsiveLayout.isDesktop(context))
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavLink(
                          label: 'Products',
                          isSelected:
                              currentRoute == '/products' ||
                              currentRoute.startsWith('/products/'),
                          onTap: () => onNavigate('/products'),
                        ),
                        const SizedBox(width: 20),
                        _NavLink(
                          label: 'Dev Logs',
                          isSelected: currentRoute == '/blog',
                          onTap: () => onNavigate('/blog'),
                        ),
                        const SizedBox(width: 20),
                        _NavLink(
                          label: 'About',
                          isSelected: currentRoute == '/about',
                          onTap: () => onNavigate('/about'),
                        ),
                        const SizedBox(width: 20),
                        _NavLink(
                          label: 'Building in Public',
                          isSelected: false,
                          onTap: () =>
                              UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                          isExternal: true,
                        ),
                        const SizedBox(width: 20),
                        _NavLink(
                          label: 'Contact',
                          isSelected: currentRoute == '/contact',
                          onTap: () => onNavigate('/contact'),
                        ),
                        const SizedBox(width: 20),

                        // GitHub Link Icon
                        IconButton(
                          icon: const Icon(Icons.code_rounded, size: 20),
                          tooltip: 'GitHub',
                          onPressed: () =>
                              UrlLauncherUtils.launchURL(BrandConfig.githubUrl),
                          color: isDark
                              ? BrandColors.textDarkSecondary
                              : BrandColors.textLightSecondary,
                        ),

                        // X Link Icon
                        IconButton(
                          icon: const Icon(
                            Icons.alternate_email_rounded,
                            size: 20,
                          ),
                          tooltip: 'X (Twitter)',
                          onPressed: () =>
                              UrlLauncherUtils.launchURL(BrandConfig.xUrl),
                          color: isDark
                              ? BrandColors.textDarkSecondary
                              : BrandColors.textLightSecondary,
                        ),

                        const SizedBox(width: 8),

                        // Theme Toggle
                        IconButton(
                          icon: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            size: 20,
                          ),
                          tooltip: 'Toggle Theme',
                          onPressed: () =>
                              context.read<ThemeCubit>().toggleTheme(),
                          color: isDark
                              ? BrandColors.textDarkSecondary
                              : BrandColors.textLightSecondary,
                        ),

                        const SizedBox(width: 12),

                        // Primary CTA
                        PrimaryButton(
                          label: 'Explore Products',
                          onPressed: () => onNavigate('/products'),
                        ),
                      ],
                    ),
                  ),
                )
              else
                // Mobile Header Actions
                Row(
                  children: [
                    // Theme Toggle
                    IconButton(
                      icon: Icon(
                        isDark
                            ? Icons.light_mode_rounded
                            : Icons.dark_mode_rounded,
                        size: 20,
                      ),
                      tooltip: 'Toggle Theme',
                      onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                      color: isDark
                          ? BrandColors.textDarkSecondary
                          : BrandColors.textLightSecondary,
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu_rounded, size: 28),
                      color: isDark
                          ? BrandColors.textDarkPrimary
                          : BrandColors.textLightPrimary,
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
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

class MobileDrawer extends StatelessWidget {
  final String currentRoute;
  final Function(String route) onNavigate;

  const MobileDrawer({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Drawer(
      backgroundColor: isDark
          ? BrandColors.surfaceDark
          : BrandColors.surfaceLight,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    BrandConfig.brandName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _DrawerItem(
                label: 'Home',
                isSelected: currentRoute == '/',
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate('/');
                },
              ),
              _DrawerItem(
                label: 'Products',
                isSelected:
                    currentRoute == '/products' ||
                    currentRoute.startsWith('/products/'),
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate('/products');
                },
              ),
              _DrawerItem(
                label: 'InvoiceFlow Pro',
                isSelected: currentRoute == '/products/invoiceflow-pro',
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate('/products/invoiceflow-pro');
                },
              ),
              _DrawerItem(
                label: 'Dev Logs',
                isSelected: currentRoute == '/blog',
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate('/blog');
                },
              ),
              _DrawerItem(
                label: 'About',
                isSelected: currentRoute == '/about',
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate('/about');
                },
              ),
              _DrawerItem(
                label: 'Building in Public',
                isSelected: false,
                onTap: () {
                  Navigator.of(context).pop();
                  UrlLauncherUtils.launchURL(BrandConfig.xUrl);
                },
              ),
              _DrawerItem(
                label: 'Contact',
                isSelected: currentRoute == '/contact',
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate('/contact');
                },
              ),
              const Spacer(),
              const Divider(),
              const SizedBox(height: 16),
              PrimaryButton(
                label: 'Explore Products',
                fullWidth: true,
                onPressed: () {
                  Navigator.of(context).pop();
                  onNavigate('/products');
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.code_rounded),
                    onPressed: () =>
                        UrlLauncherUtils.launchURL(BrandConfig.githubUrl),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.alternate_email_rounded),
                    onPressed: () =>
                        UrlLauncherUtils.launchURL(BrandConfig.xUrl),
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

class _NavLink extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isExternal;

  const _NavLink({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isExternal = false,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final Color normalColor = widget.isSelected
        ? BrandColors.electricBlue
        : (isDark
              ? BrandColors.textDarkSecondary
              : BrandColors.textLightSecondary);

    final Color activeColor = widget.isSelected
        ? BrandColors.electricBlue
        : (isDark ? BrandColors.textDarkPrimary : BrandColors.textLightPrimary);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Text(
              widget.label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 15,
                fontWeight: widget.isSelected
                    ? FontWeight.w700
                    : FontWeight.w500,
                color: _isHovered ? activeColor : normalColor,
              ),
            ),
            if (widget.isExternal) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.north_east_rounded,
                size: 12,
                color: _isHovered ? activeColor : normalColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        label,
        style: theme.textTheme.titleMedium?.copyWith(
          fontSize: 18,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected
              ? BrandColors.electricBlue
              : (isDark
                    ? BrandColors.textDarkPrimary
                    : BrandColors.textLightPrimary),
        ),
      ),
      onTap: onTap,
    );
  }
}
