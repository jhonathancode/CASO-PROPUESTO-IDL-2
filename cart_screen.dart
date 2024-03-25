class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartViewModel _viewModel = CartViewModel();

  @override
  void initState() {
    super.initState();
    // Obtener la lista de productos del carrito (de la memoria, base de datos, etc.)
    // _viewModel._productsInCart = ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrito')),
      body: Column(
        children: [
          // Mostrar la lista de productos en un ListView
          ListView.builder(
            itemCount: _viewModel._productsInCart.length,
            itemBuilder: (context, index) {
              return CartItem(_viewModel._productsInCart[index]);
            },
          ),
          // Mostrar el total del carrito
          Padding(
            padding: const EdgeInsets
