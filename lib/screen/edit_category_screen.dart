import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/category_form_provider.dart';
import 'package:flutter_application_1/services/category_services.dart';
import 'package:provider/provider.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);

    if (categoryService.selectedCategory == null) {
      // Manejar el caso en que selectedCategory es nulo (puedes mostrar un mensaje de error o tomar alguna otra acción).
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Categoría no encontrada.'),
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (_) => CategoryFormProvider(categoryService.selectedCategory!),
      child: _CategoryScreenBody(categoryService: categoryService),
    );
  }
}

class _CategoryScreenBody extends StatelessWidget {
  final CategoryService categoryService;

  const _CategoryScreenBody({
    Key? key,
    required this.categoryService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Categoría'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campos de edición de categoría
            TextFormField(
              initialValue: categoryForm.categoryName,
              onChanged: (value) {
                categoryForm.categoryName = value;
              },
              decoration: InputDecoration(
                labelText: 'Nombre de Categoría',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              await categoryService.deleteCategory(categoryForm.category, context);
              // Navegar o tomar acciones después de eliminar la categoría.
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save_alt_outlined),
            onPressed: () async {
              if (categoryForm.isValidForm()) {
                await categoryService.editOrCreateCategory(categoryForm.category);
                // Navegar o tomar acciones después de guardar la categoría.
              }
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
