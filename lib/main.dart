import 'package:anuncio_de_produtos/screens/home/productList.dart';
import 'package:anuncio_de_produtos/screens/registers/formAnnouncement.dart';
import 'package:anuncio_de_produtos/screens/registers/formEdit.dart';
import 'package:anuncio_de_produtos/screens/registers/formRemove.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Anúncio de Produtos",
      routes: {
        "/": (BuildContext context) => ProductList(),
        "/announcement": (BuildContext context) => FormAnnouncement(),
        "/edit": (BuildContext context) => FormEdit(),
        "/remove": (BuildContext context) => FormRemove(),
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}
