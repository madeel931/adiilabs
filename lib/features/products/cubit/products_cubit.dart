import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/models/product_model.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit()
    : super(
        ProductsState(
          products: ProductsData.allProducts,
          featuredProduct: ProductsData.invoiceFlowPro,
        ),
      );

  void selectCategory(String? category) {
    emit(state.copyWith(selectedCategory: category));
  }
}
