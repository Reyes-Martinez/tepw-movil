import 'package:flutter/material.dart';
import 'package:tepwshop/pages/all_products.dart';
import 'package:tepwshop/services/product_service.dart';
import 'package:tepwshop/models/product.dart';

class ProductSearchDelegate extends SearchDelegate<Product?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => this.query = "")
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => this.close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length == 0) {
      return Text('No hay valor en el query');
    }

    final productService = new ProductService();
    return FutureBuilder(
        future: productService.getProductsByName(query),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _showProduct(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
              ),
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(title: Text('Sugerencias'));
  }

  Widget _showProduct(List<Product> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text("${product.name}"),
            subtitle: Text("Precio: ${product.price}"),
            trailing: Text('Stock: ${product.inventory}'),
            onTap: () {
              this.close(context, product);
            },
          );
        });
  }
}
