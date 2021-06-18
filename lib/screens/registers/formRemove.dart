import 'package:anuncio_de_produtos/DAO/productDAO.dart';
import 'package:anuncio_de_produtos/model/product.dart';
import 'package:anuncio_de_produtos/shared/menu.dart';
import 'package:flutter/material.dart';

class FormRemove extends StatelessWidget {
  final bgColor = const Color(0xFF836FFF);
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Remoção de Anúncios",
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
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    saveRemove(context);
                  },
                  child: Text("Remover Anúncio"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveRemove(BuildContext mainContext) async {
    int _code = int.parse(codeController.text);
    late String message;

    Product product = Product(
      code: _code,
    );
    int result = await ProductDAO.removeRecord("products", product.code!);

    if (result != 0) {
      message = "O anúncio foi removido com sucesso!";
    } else {
      message = "Não foi possível remover o anúncio.";
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
