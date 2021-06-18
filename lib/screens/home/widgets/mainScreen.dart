import 'package:anuncio_de_produtos/model/product.dart';
import 'package:anuncio_de_produtos/shared/menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final bgColor = const Color(0xFF836FFF);
  final dynamic _data;
  late List<Product> _products;

  MainScreen(this._data);

  @override
  Widget build(BuildContext context) {
    _products = prepareProducts(_data);
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Lista de Anúncios",
        ),
        centerTitle: true,
      ),
      drawer: Menu(),
      body: ListView.builder(
        itemBuilder: builder,
        itemCount: _products.length,
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    return ListTile(
      leading: Icon(
        Icons.announcement,
        size: 50,
      ),
      title: Text(
        _products.elementAt(index).name!,
      ),
      subtitle: Text(
        "Preço: R\$" + _products.elementAt(index).price!,
      ),
    );
  }

  List<Product> prepareProducts(dynamic data) {
    List<Product> products = [];
    for (int index = 0; index < data.length; index++) {
      products.add(
        Product.toObject(data[index]),
      );
    }
    return products;
  }
}
