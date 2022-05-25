import 'package:dio/dio.dart';
import 'package:tepwshop/models/product.dart';

class ProductService {
  final _dio = new Dio();
  Future getProductsByName(String name) async {
    try {
      final url = "https://tepw-rest.herokuapp.com/api/product/$name";
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
}
