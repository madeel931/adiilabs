import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/brand_colors.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../cubit/demo_invoice_cubit.dart';
import '../../cubit/demo_invoice_state.dart';

class InteractiveDemoWidget extends StatelessWidget {
  const InteractiveDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return BlocBuilder<DemoInvoiceCubit, DemoInvoiceState>(
      builder: (context, state) {
        final cubit = context.read<DemoInvoiceCubit>();

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? BrandColors.surfaceDark : BrandColors.cardLight,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: BrandColors.electricBlue.withValues(alpha: 0.4),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: BrandColors.electricBlue.withValues(alpha: 0.12),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Interactive Header Banner
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
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
                    const Icon(
                      Icons.touch_app_rounded,
                      color: BrandColors.electricBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Live Interactive Invoice Generator',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: isDark
                            ? BrandColors.textDarkPrimary
                            : BrandColors.textLightPrimary,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: BrandColors.badgeGreenBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.bolt_rounded,
                            size: 12,
                            color: BrandColors.badgeGreenText,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'LIVE FLUTTER DEMO',
                            style: TextStyle(
                              color: BrandColors.badgeGreenText,
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Controls Column
                    Expanded(
                      flex: isMobile ? 0 : 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Test Live Controls',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: BrandColors.electricBlue,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Client Name Input
                          Text('Client Name', style: theme.textTheme.bodySmall),
                          const SizedBox(height: 6),
                          TextFormField(
                            initialValue: state.clientName,
                            style: TextStyle(
                              color: isDark
                                  ? BrandColors.white
                                  : BrandColors.deepNavy,
                              fontSize: 13,
                            ),
                            decoration: _inputDecoration(isDark, 'Client name'),
                            onChanged: (val) => cubit.updateClientName(val),
                          ),
                          const SizedBox(height: 12),

                          // Item Description Input
                          Text(
                            'Item / Service',
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            initialValue: state.itemDescription,
                            style: TextStyle(
                              color: isDark
                                  ? BrandColors.white
                                  : BrandColors.deepNavy,
                              fontSize: 13,
                            ),
                            decoration: _inputDecoration(
                              isDark,
                              'Service description',
                            ),
                            onChanged: (val) =>
                                cubit.updateItemDescription(val),
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              // Quantity Slider
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quantity: ${state.quantity}',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    Slider(
                                      value: state.quantity.toDouble(),
                                      min: 1,
                                      max: 10,
                                      divisions: 9,
                                      activeColor: BrandColors.electricBlue,
                                      onChanged: (val) =>
                                          cubit.updateQuantity(val.round()),
                                    ),
                                  ],
                                ),
                              ),

                              // Rate Input
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rate (${state.currencySymbol})',
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    const SizedBox(height: 6),
                                    TextFormField(
                                      initialValue: state.rate.toStringAsFixed(
                                        0,
                                      ),
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                        color: isDark
                                            ? BrandColors.white
                                            : BrandColors.deepNavy,
                                        fontSize: 13,
                                      ),
                                      decoration: _inputDecoration(
                                        isDark,
                                        'Rate',
                                      ),
                                      onChanged: (val) {
                                        final doubleVal = double.tryParse(val);
                                        if (doubleVal != null) {
                                          cubit.updateRate(doubleVal);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Currency Selector Row
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'Currency: ',
                                style: theme.textTheme.bodySmall,
                              ),
                              _currencyChip(cubit, state, '\$', 'USD'),
                              _currencyChip(cubit, state, 'ر.س', 'SAR'),
                              _currencyChip(cubit, state, '€', 'EUR'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    if (!isMobile) const SizedBox(width: 32),
                    if (isMobile) const SizedBox(height: 24),

                    // Invoice Live Preview Card
                    Expanded(
                      flex: isMobile ? 0 : 7,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: state.isDarkMode
                              ? BrandColors.deepNavy
                              : BrandColors.surfaceLight,
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
                            // Invoice Preview Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'INVOICE #INV-2026-001',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14,
                                        letterSpacing: 0.5,
                                        color: state.isDarkMode
                                            ? BrandColors.electricBlue
                                            : BrandColors.indigo,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Issued by ADii Labs Studio Engine',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: state.isDarkMode
                                            ? BrandColors.mutedSlate
                                            : BrandColors.textLightSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: BrandColors.badgeGreenBg,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'PAID',
                                    style: TextStyle(
                                      color: BrandColors.badgeGreenText,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 24),

                            // Bill To
                            Text(
                              'Billed To:',
                              style: TextStyle(
                                fontSize: 11,
                                color: state.isDarkMode
                                    ? BrandColors.mutedSlate
                                    : BrandColors.textLightSecondary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              state.clientName.isEmpty
                                  ? 'Acme Studio Ltd'
                                  : state.clientName,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: state.isDarkMode
                                    ? BrandColors.white
                                    : BrandColors.deepNavy,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Items Table
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: state.isDarkMode
                                    ? BrandColors.surfaceDark
                                    : BrandColors.cardLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      state.itemDescription.isEmpty
                                          ? 'Flutter App Development'
                                          : state.itemDescription,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: state.isDarkMode
                                            ? BrandColors.white
                                            : BrandColors.deepNavy,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${state.quantity} x ${state.currencySymbol}${state.rate.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: state.isDarkMode
                                          ? BrandColors.mutedSlate
                                          : BrandColors.textLightSecondary,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    '${state.currencySymbol}${state.subtotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: state.isDarkMode
                                          ? BrandColors.white
                                          : BrandColors.deepNavy,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Calculations Summary
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Tax (${state.taxPercent.toStringAsFixed(0)}%): ${state.currencySymbol}${state.taxAmount.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: state.isDarkMode
                                            ? BrandColors.mutedSlate
                                            : BrandColors.textLightSecondary,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Total: ${state.currencySymbol}${state.total.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: BrandColors.electricBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration(bool isDark, String hint) {
    return InputDecoration(
      hintText: hint,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      filled: true,
      fillColor: isDark ? BrandColors.deepNavy : BrandColors.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: isDark ? BrandColors.borderDark : BrandColors.borderLight,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: BrandColors.electricBlue,
          width: 1.5,
        ),
      ),
    );
  }

  Widget _currencyChip(
    DemoInvoiceCubit cubit,
    DemoInvoiceState state,
    String symbol,
    String code,
  ) {
    final isSelected = state.currencySymbol == symbol;
    return GestureDetector(
      onTap: () => cubit.updateCurrency(symbol),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? BrandColors.electricBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected
                ? BrandColors.electricBlue
                : BrandColors.mutedSlate,
          ),
        ),
        child: Text(
          '$code ($symbol)',
          style: TextStyle(
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? BrandColors.white : BrandColors.mutedSlate,
          ),
        ),
      ),
    );
  }
}
