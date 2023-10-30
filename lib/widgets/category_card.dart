import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItem category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardDecorations(),
        child: Stack(alignment: Alignment.bottomLeft, children: [
          _CategoryDetails(category: category),
          // Puedes agregar más elementos específicos de las categorías si es necesario.
        ]),
      ),
    );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(38, 177, 241, 1),
        offset: Offset(0, 5),
        blurRadius: 10,
      ),
    ],
  );
}

class _CategoryDetails extends StatelessWidget {
  final CategoryItem category;

  const _CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 80,
        decoration: _boxDecorations(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.categoryName,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            // Puedes mostrar otros campos de categoría aquí según tus necesidades.
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecorations() => const BoxDecoration(
    color: Color.fromRGBO(38, 177, 241, 1),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );
}
