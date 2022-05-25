import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tepwshop/models/product.dart';
import 'package:tepwshop/search/product_search.dart';

class All_Product extends StatefulWidget {
  @override
  State<All_Product> createState() => _All_ProductState();
}

class _All_ProductState extends State<All_Product> {
  final _dio = new Dio();

  List<Product> data = [];

  Future<List<Product>> getProducts() async {
    try {
      final url = "https://tepw-rest.herokuapp.com/api/product/all";
      final respuesta = await _dio.get(url);
      final List<dynamic> productList = await respuesta.data;
      List<Product> products =
          productList.map((obj) => Product.fromJson(obj)).toList();
      return products;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts().then((value) => setState(() {
          data.addAll(value);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Buscar', style: TextStyle(color: Colors.white)),
              shape: StadiumBorder(),
              splashColor: Colors.transparent,
              color: Colors.blue,
              onPressed: () async {
                showSearch(context: context, delegate: ProductSearchDelegate());
              },
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Image.network(data[index].image),
                        title: Text("${data[index].name}"),
                        subtitle: Text("Precio: ${data[index].price}"),
                        trailing: Text('Stock: ${data[index].inventory}'),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
