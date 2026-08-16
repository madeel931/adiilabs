import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/brand_colors.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../features/newsletter/cubit/newsletter_cubit.dart';
import '../../features/newsletter/cubit/newsletter_state.dart';

class NewsletterSignupWidget extends StatelessWidget {
  const NewsletterSignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return BlocBuilder<NewsletterCubit, NewsletterState>(
      builder: (context, state) {
        final cubit = context.read<NewsletterCubit>();

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isMobile ? 24 : 36),
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
                  alpha: isDark ? 0.08 : 0.04,
                ),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: BrandColors.electricBlue.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mark_email_read_rounded,
                      color: BrandColors.electricBlue,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Subscribe to ADii Labs Product Updates',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 20 : 24,
                  color: isDark
                      ? BrandColors.textDarkPrimary
                      : BrandColors.textLightPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Get early access to InvoiceFlow Pro releases, studio dev logs, and Flutter + AI insights.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? BrandColors.textDarkSecondary
                      : BrandColors.textLightSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              if (state.isSuccess)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: BrandColors.badgeGreenBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: BrandColors.badgeGreenText.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: BrandColors.badgeGreenText,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Thank you for subscribing! You are now on the ADii Labs early access list.',
                          style: TextStyle(
                            color: BrandColors.badgeGreenText,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: state.email,
                              onChanged: (val) => cubit.updateEmail(val),
                              style: TextStyle(
                                color: isDark
                                    ? BrandColors.textDarkPrimary
                                    : BrandColors.textLightPrimary,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your email address',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                filled: true,
                                fillColor: isDark
                                    ? BrandColors.deepNavy
                                    : BrandColors.surfaceLight,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: isDark
                                        ? BrandColors.borderDark
                                        : BrandColors.borderLight,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: BrandColors.electricBlue,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: state.isSubmitting
                                ? null
                                : () => cubit.subscribe(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: BrandColors.electricBlue,
                              foregroundColor: BrandColors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: state.isSubmitting
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: BrandColors.white,
                                    ),
                                  )
                                : const Text(
                                    'Subscribe',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      if (state.errorMessage != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          state.errorMessage!,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
