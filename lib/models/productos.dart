import 'dart:convert';

class Product {
  Product({
    required this.listado,
  });

  List<Listado> listado;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        listado:
            List<Listado>.from(json["Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productState,
  });

  int productId;
  String productName;
  int productPrice;
  String productImage;
  String productState;

  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productImage: json["product_image"],
        productState: json["product_state"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "product_image": productImage,
        "product_state": productState,
      };

  Listado copy() => Listado(
      productId: productId,
      productName: productName,
      productPrice: productPrice,
      productImage: productImage,
      productState: productState);
}
