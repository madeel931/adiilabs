class DemoInvoiceState {
  final String clientName;
  final String itemDescription;
  final int quantity;
  final double rate;
  final double taxPercent;
  final String currencySymbol;
  final bool isDarkMode;

  const DemoInvoiceState({
    required this.clientName,
    required this.itemDescription,
    required this.quantity,
    required this.rate,
    required this.taxPercent,
    required this.currencySymbol,
    required this.isDarkMode,
  });

  double get subtotal => quantity * rate;
  double get taxAmount => subtotal * (taxPercent / 100);
  double get total => subtotal + taxAmount;

  DemoInvoiceState copyWith({
    String? clientName,
    String? itemDescription,
    int? quantity,
    double? rate,
    double? taxPercent,
    String? currencySymbol,
    bool? isDarkMode,
  }) {
    return DemoInvoiceState(
      clientName: clientName ?? this.clientName,
      itemDescription: itemDescription ?? this.itemDescription,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      taxPercent: taxPercent ?? this.taxPercent,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
