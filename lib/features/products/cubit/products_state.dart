import '../../../shared/models/product_model.dart';

class ProductsState {
  final List<ProductModel> products;
  final ProductModel featuredProduct;
  final String? selectedCategory;

  const ProductsState({
    required this.products,
    required this.featuredProduct,
    this.selectedCategory,
  });

  List<ProductModel> get filteredProducts {
    if (selectedCategory == null || selectedCategory!.isEmpty) {
      return products;
    }
    return products.where((p) => p.category == selectedCategory).toList();
  }

  ProductsState copyWith({
    List<ProductModel>? products,
    ProductModel? featuredProduct,
    String? selectedCategory,
  }) {
    return ProductsState(
      products: products ?? this.products,
      featuredProduct: featuredProduct ?? this.featuredProduct,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
