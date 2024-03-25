class ProductDetailScreen extends StatefulWidget {
  final Product product;
  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailViewModel _viewModel = ProductDetailViewModel(widget.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: Column(
        children: [
          Image.network(widget.product.imageUrl),
          Text(widget.product.description),
          Text('\$${widget.product.price}'),
          Row( 
            children: [
              IconButton(icon: Icon(Icons.remove), onPressed: _viewModel.decreaseQuantity),
              Text('${_viewModel._quantity}'),
              IconButton(icon: Icon(Icons.add), onPressed: _viewModel.increaseQuantity),
            ],
          ),
          if (_viewModel.getErrorMessage().isNotEmpty)
            Text(_viewModel.getErrorMessage(), style: TextStyle(color: Colors.red)),
          ElevatedButton(
            child: Text('Agregar al Carrito'),
            onPressed: _viewModel.canAddToCart() ? () {
              // Lógica para agregar al carrito usando la cantidad del ViewModel
              // ...
            } : null,
          ),
        ],
      ),
    );
  }
}
