import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';

class CategoryFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CategoryItem category;

  CategoryFormProvider(this.category);

  String _categoryName = ''; // Agrega una propiedad para el nombre de la categoría.

  String get categoryName => _categoryName; // Getter para el nombre de la categoría.

  set categoryName(String value) {
    _categoryName = value;
    category.categoryName = value; // Actualiza la categoría interna.
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
