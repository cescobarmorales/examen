import 'package:flutter/material.dart';

class HomeCategoryScreen extends StatelessWidget {
   HomeCategoryScreen({Key? key}) : super(key: key);

  final List<String> productos = ['PRODUCTOS'];
  final List<String> categorias = ['CATEGORÍAS'];
  final List<String> proveedores = ['PROVEEDORES'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 177, 241, 1),
        elevation: 10,
        title: const Text('Menú Principal'),
      ),
      body: GridView.count(
        crossAxisCount: 3, // 3 columnas en la cuadrícula
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          for (var producto in productos)
            _buildItem(context, Icons.book, producto, 'list_product'),
          for (var categoria in categorias)
            _buildItem(context, Icons.category, categoria, 'list_category'),
          for (var proveedor in proveedores)
            _buildItem(context, Icons.supervisor_account, proveedor, 'list_proveedor'),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String text, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 60.0),
          SizedBox(height: 20.0),
          Text(text),
        ],
      ),
    );
  }
}
