class CartViewModel {
  final List<Product> productsInCart = [];

  void addToCart(Product product) {
    productsInCart.add(
