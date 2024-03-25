class ProductDetailViewModel {
  final Product product;
  int _quantity = 1;
  int _availableStock = 10; // Stock del producto

  ProductDetailViewModel(this.product);

  void increaseQuantity() {
    if (_quantity < _availableStock) _quantity++;
  }

  void decreaseQuantity() {
    if (_quantity > 1) _quantity--;
  }

  bool canAddToCart() {
    return _quantity <= _availableStock;
  }

  String getErrorMessage() {
    if (_quantity > _availableStock) {
      return 'No hay stock suficiente para $_quantity unidades.';
    }
    return '';
  }
}
