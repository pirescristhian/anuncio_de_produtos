import 'package:anuncio_de_produtos/DAO/productDAO.dart';
import 'package:anuncio_de_produtos/model/product.dart';
import 'package:anuncio_de_produtos/shared/menu.dart';
import 'package:flutter/material.dart';

class FormEdit extends StatelessWidget {
  final bgColor = const Color(0xFF836FFF);
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Edição de Anúncios",
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
                    labelText: "Código do Produto",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.number,
                  controller: codeController,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Nome do Anúncio",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Preço do Produto",
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
                    saveEdit(context);
                  },
                  child: Text(
                    "Editar Anúncio",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveEdit(BuildContext mainContext) async {
    int code = int.parse(codeController.text);
    String name = nameController.text;
    String price = priceController.text;
    String message;

    Product product = Product(
      code: code,
      name: name,
      price: price,
    );
    int result = await ProductDAO.updateRecord(
      "products",
      product.toMap(),
    );

    if (result != 0) {
      message = "O produto foi editado com sucesso!";
    } else {
      message = "Não foi possível editar o anúncio.";
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
