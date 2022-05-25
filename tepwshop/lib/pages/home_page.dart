import 'package:flutter/material.dart';
import 'package:tepwshop/pages/all_products.dart';
import 'package:tepwshop/search/product_search.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido a tepwshop'),
            MaterialButton(
              child: Text('Buscar', style: TextStyle(color: Colors.white)),
              shape: StadiumBorder(),
              splashColor: Colors.transparent,
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => All_Product()));
                // showSearch(context: context, delegate: ProductSearchDelegate());
              },
            ),
          ],
        ),
      ),
    );
  }
}
