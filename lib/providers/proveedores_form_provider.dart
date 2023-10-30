import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProviderItem provider;

  ProviderFormProvider(this.provider);

  String _providerName = '';
  String _providerLastName = '';
  String _providerMail = '';
  String _providerState = 'Activo'; // Establece el estado predeterminado según tus necesidades.

  String get providerName => _providerName;
  String get providerLastName => _providerLastName;
  String get providerMail => _providerMail;
  String get providerState => _providerState;

  set providerName(String value) {
    _providerName = value;
    provider.providerName = value;
    notifyListeners();
  }

  set providerLastName(String value) {
    _providerLastName = value;
    provider.providerLastName = value;
    notifyListeners();
  }

  set providerMail(String value) {
    _providerMail = value;
    provider.providerMail = value;
    notifyListeners();
  }

  set providerState(String value) {
    _providerState = value;
    provider.providerState = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
