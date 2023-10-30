import 'dart:convert';

class Provider {
  Provider({
    required this.providers,
  });

  List<ProviderItem> providers;

  factory Provider.fromJson(String str) => Provider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provider.fromMap(Map<String, dynamic> json) => Provider(
        providers: List<ProviderItem>.from(json["Proveedores Listado"].map((x) => ProviderItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado": List<dynamic>.from(providers.map((x) => x.toMap())),
      };
}

class ProviderItem {
  ProviderItem({
    required this.providerId,
    required this.providerName,
    required this.providerLastName,
    required this.providerMail,
    required this.providerState,
  });

  int providerId; // Añade el campo providerId de tipo int

  String providerName;
  String providerLastName;
  String providerMail;
  String providerState;

  factory ProviderItem.fromJson(String str) => ProviderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProviderItem.fromMap(Map<String, dynamic> json) => ProviderItem(
        providerId: json["providerid"], // Añade provider_id
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerMail: json["provider_mail"],
        providerState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "providerid": providerId, // Añade provider_id
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerMail,
        "provider_state": providerState,
      };
}
