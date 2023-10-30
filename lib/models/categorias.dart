import 'dart:convert';

class Category {
  Category({
    required this.categories,
  });

  List<CategoryItem>  categories;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        categories:
            List<CategoryItem>.from(json["Listado Categorias"].map((x) => CategoryItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado Categorias": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}

class CategoryItem {
  CategoryItem({
    required this.categoryId,
    required this.categoryName,
    // Agrega otros campos de categoría según tus necesidades.
  });

  int categoryId;
  String categoryName;
  // Agrega otros campos de categoría aquí.

  factory CategoryItem.fromJson(String str) => CategoryItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryItem.fromMap(Map<String, dynamic> json) => CategoryItem(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        // Mapea otros campos de categoría aquí.
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "category_name": categoryName,
        // Agrega otros campos de categoría aquí.
      };
}
