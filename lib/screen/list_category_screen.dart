import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart'; // Asegúrate de importar tu modelo de categorías.
import 'package:flutter_application_1/screen/screen.dart';
import 'package:flutter_application_1/services/category_services.dart';
import 'package:flutter_application_1/widgets/category_card.dart';
import 'package:provider/provider.dart'; // Asegúrate de tener el widget de CategoryCard.

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);

    if (categoryService.isLoading) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de categorías'),
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.selectCategory = categoryService.categories[index];
            Navigator.pushNamed(context, 'editCategory'); // Asegúrate de que tengas una ruta 'editCategory' para la edición de categorías.
          },
          child: CategoryCard(category: categoryService.categories[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.selectCategory = CategoryItem(
            categoryId: 0,
            categoryName: '',
            // Otros campos de categoría según tus necesidades.
          );
          Navigator.pushNamed(context, 'edit_category'); // Asegúrate de que tengas una ruta 'editCategory' para la creación de categorías.
        },
      ),
    );
  }
}
