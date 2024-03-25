import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenViewModel _viewModel = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tienda App')),
      body: _viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        itemCount: _viewModel._products.length + (_viewModel.hasMorePages ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _viewModel._products.length) {
            if (_viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(); 
            }
          }
          return ProductItem(_viewModel._products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.name),
          Text('\$${product.price}'),
          ElevatedButton(
            child: Text('Ver Detalle'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product)));
            },
          ),
        ],
      ),
    );
  }
}
