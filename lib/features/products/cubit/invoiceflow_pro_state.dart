import '../../../shared/models/product_model.dart';

class InvoiceFlowProState {
  final ProductModel product;
  final int selectedScreenshotIndex;

  const InvoiceFlowProState({
    required this.product,
    required this.selectedScreenshotIndex,
  });

  String get currentScreenshotAsset =>
      product.screenshotAssets[selectedScreenshotIndex];

  InvoiceFlowProState copyWith({
    ProductModel? product,
    int? selectedScreenshotIndex,
  }) {
    return InvoiceFlowProState(
      product: product ?? this.product,
      selectedScreenshotIndex:
          selectedScreenshotIndex ?? this.selectedScreenshotIndex,
    );
  }
}
