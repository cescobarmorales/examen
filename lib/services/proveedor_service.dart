import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProviderService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<ProviderItem> providers = [];
  ProviderItem? selectedProvider;
  bool isLoading = true;
  bool isEditCreate = true;

  ProviderService() {
    loadProviders();
  }

  set selectProvider(ProviderItem selectProvider) {}

  Future loadProviders() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final providersMap = Provider.fromJson(response.body);
    print(response.body);
    providers = providersMap.providers;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateProvider(ProviderItem provider) async {
    isEditCreate = true;
    notifyListeners();
    if (provider.providerId == 0) {
      await createProvider(provider);
    } else {
      await updateProvider(provider);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateProvider(ProviderItem provider) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: provider.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    // Actualizamos la lista de proveedores
    final index = providers
        .indexWhere((element) => element.providerId == provider.providerId);
    providers[index] = provider;

    return '';
  }

  Future createProvider(ProviderItem provider) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: provider.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    providers.add(provider);
    return '';
  }

  Future deleteProvider(ProviderItem provider, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: provider.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    providers.clear(); // Borra toda la lista de proveedores
    loadProviders();
    Navigator.of(context).pushNamed('listProvider');
    return '';
  }
}
