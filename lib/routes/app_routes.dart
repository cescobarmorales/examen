import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'category': (BuildContext context) =>  HomeCategoryScreen(),
    'list_product': (BuildContext context) => const ListProductScreen(),
    'list_category': (BuildContext context) => const ListCategoryScreen(),
    'list_proveedor': (BuildContext context) => const ListProveedoresScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
    'edit_category': (BuildContext context) => const EditCategoryScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
