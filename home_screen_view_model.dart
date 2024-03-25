import 'package:http/http.dart' as http;
import 'package:json_decode/json_decode.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  Product(this.id, this.name, this.description, this.price, this.quantity, this.imageUrl);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['name'],
      json['description'],
      json['price'].toDouble(),
      json['quantity'],
      json['imageUrl'],
    );
  }
}

class HomeScreenViewModel {
  final List<Product> _products = [];
  bool isLoading = false;
  bool hasMorePages = true;
  int _currentPage = 1;

  Future<void> fetchProducts() async {
    isLoading = true;
    // Actualiza el estado para reflejar que estás cargando (esto podría actualizar tu vista)

    try {
      final response = await http.get(Uri.parse('https://api.example.com/products?page=$_currentPage'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final products = List<Product>.from(jsonData['data'].map((json) => Product.fromJson(json)));
        _products.addAll(products);
        hasMorePages = jsonData['hasMorePages'];
      } else {
        // Maneja el error de la API
      }
    } catch (error) {
      // Maneja el error de la conexión
    } finally {
      isLoading = false;
      // Actualiza el estado para reflejar que la carga ha terminado (esto podría actualizar tu vista)
    }
  }

  void loadNextPage() {
    if (hasMorePages) {
      _currentPage++;
      fetchProducts();
    }
  }
}
