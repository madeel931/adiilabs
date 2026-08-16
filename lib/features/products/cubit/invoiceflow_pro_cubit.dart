import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/models/product_model.dart';
import 'invoiceflow_pro_state.dart';

class InvoiceFlowProCubit extends Cubit<InvoiceFlowProState> {
  InvoiceFlowProCubit()
    : super(
        const InvoiceFlowProState(
          product: ProductsData.invoiceFlowPro,
          selectedScreenshotIndex: 0,
        ),
      );

  void selectScreenshot(int index) {
    if (index >= 0 && index < state.product.screenshotAssets.length) {
      emit(state.copyWith(selectedScreenshotIndex: index));
    }
  }
}
