import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:provider/provider.dart' as provider; // Damos un alias 'provider'

import '../models/proveedores.dart';
import 'loading_screen.dart';

class ListProveedoresScreen extends StatelessWidget {
  const ListProveedoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerService = provider.Provider.of<ProviderService>(context);

    if (providerService.isLoading){
      return const LoadingScreen();
    } 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Proveedores'),
      ),
      body: ListView.builder(
        itemCount: providerService.providers.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              providerService.selectedProvider = ProviderItem(
                providerId: providerService.providers[index].providerId,
                providerName: providerService.providers[index].providerName,
                providerLastName: providerService.providers[index].providerLastName,
                providerMail: providerService.providers[index].providerMail,
                providerState: providerService.providers[index].providerState,
              );
              Navigator.pushNamed(context, 'edit_provider');
            },
            child: ProviderCard(provider: providerService.providers[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          providerService.selectedProvider = ProviderItem(
            providerId: 0,
            providerName: '',
            providerLastName: '',
            providerMail: '',
            providerState: 'Activo',
          );
          Navigator.pushNamed(context, 'editProvider');
        },
      ),
    );
  }
}

class ProviderCard extends StatelessWidget {
  final ProviderItem provider;

  ProviderCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.business),
        title: Text(provider.providerName),
        subtitle: Text(provider.providerLastName),
        trailing: Text(provider.providerState),
      ),
    );
  }
}
