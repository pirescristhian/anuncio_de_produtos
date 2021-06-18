import 'package:anuncio_de_produtos/DAO/productDAO.dart';
import 'package:anuncio_de_produtos/model/product.dart';
import 'package:anuncio_de_produtos/shared/menu.dart';
import 'package:flutter/material.dart';

class FormAnnouncement extends StatelessWidget {
  final bgColor = const Color(0xFF836FFF);
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Anúnciar Produto",
        ),
        centerTitle: true,
      ),
      drawer: Menu(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Produto",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                  controller: nameController,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Preço",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                  controller: priceController,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    saveAnnouncement(context);
                  },
                  child: Text(
                    "Anúnciar Produto",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveAnnouncement(BuildContext mainContext) async {
    String name = nameController.text;
    String price = priceController.text;
    String message;

    Product product = Product(
      name: name,
      price: price,
    );
    int result = await ProductDAO.insertRecord(
      "products",
      product.toMap(),
    );

    if (result != 0) {
      message = "O produto foi anunciado com sucesso!";
    } else {
      message = "Não foi possível concluir o anúncio.";
    }

    showDialog(
      context: mainContext,
      builder: (context) => AlertDialog(
        title: Text("Mensagem do Sistema"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
