import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);
              },
              icon: Icon(Icons.list),
              label: Text("Lista de Anúncios"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/announcement", (route) => false);
              },
              icon: Icon(Icons.announcement_outlined),
              label: Text("Anúnciar Produto"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/edit", (route) => false);
              },
              icon: Icon(Icons.edit_outlined),
              label: Text("Editar Anúncio"),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/remove", (route) => false);
              },
              icon: Icon(Icons.delete_outline),
              label: Text("Excluir Anúncio"),
            ),
          ],
        ),
      ),
    );
  }
}
