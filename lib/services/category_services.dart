import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/categorias.dart';

class CategoryService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<CategoryItem> categories = [];
  CategoryItem? selectedCategory;
  bool isLoading = true;
  bool isEditCreate = true;

  CategoryService() {
    loadCategories();
  }

  set selectCategory(CategoryItem selectCategory) {}

  Future loadCategories() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final categoriesMap = Category.fromJson(response.body);
    print(response.body);
    categories = categoriesMap.categories;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateCategory(CategoryItem category) async {
    isEditCreate = true;
    notifyListeners();
    if (category.categoryId == 0) {
      await createCategory(category);
    } else {
      await updateCategory(category);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateCategory(CategoryItem category) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    // Actualizamos la lista de categorías
    final index = categories
        .indexWhere((element) => element.categoryId == category.categoryId);
    categories[index] = category;

    return '';
  }

  Future createCategory(CategoryItem category) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    categories.add(category);
    return '';
  }

  Future deleteCategory(CategoryItem category, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    categories.clear(); // Borra toda la lista de categorías
    loadCategories();
    Navigator.of(context).pushNamed('listCategory');
    return '';
  }
}
