import 'package:flutter_bloc/flutter_bloc.dart';
import 'demo_invoice_state.dart';

class DemoInvoiceCubit extends Cubit<DemoInvoiceState> {
  DemoInvoiceCubit()
    : super(
        const DemoInvoiceState(
          clientName: 'Acme Studio Ltd',
          itemDescription: 'Flutter App Development & AI Workflow',
          quantity: 1,
          rate: 1500.00,
          taxPercent: 5.0,
          currencySymbol: '\$',
          isDarkMode: true,
        ),
      );

  void updateClientName(String name) {
    emit(state.copyWith(clientName: name));
  }

  void updateItemDescription(String description) {
    emit(state.copyWith(itemDescription: description));
  }

  void updateQuantity(int quantity) {
    if (quantity > 0) {
      emit(state.copyWith(quantity: quantity));
    }
  }

  void updateRate(double rate) {
    if (rate >= 0) {
      emit(state.copyWith(rate: rate));
    }
  }

  void updateTaxPercent(double taxPercent) {
    if (taxPercent >= 0) {
      emit(state.copyWith(taxPercent: taxPercent));
    }
  }

  void updateCurrency(String currencySymbol) {
    emit(state.copyWith(currencySymbol: currencySymbol));
  }

  void togglePreviewMode() {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }
}
