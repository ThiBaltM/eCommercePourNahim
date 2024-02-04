import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/Cart.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:td_ecommerce/ui/style.dart';

class Paiement extends StatefulWidget {
  final Cart _cart;
  const Paiement(this._cart, {super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: Scaffold(
        backgroundColor: AppTheme.blackColor,
        appBar: AppBar(
          title: Text('Panier'),
          backgroundColor: AppTheme.primaryColor,
        ),
        body: Center(
          child: Card(
            color: AppTheme.primaryColor,
            margin: EdgeInsets.all(20),
            child: Column(
            children: [
              Text('Numero de rue'),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ex: 125',
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Filed required';
                }
                  return null;
                },
              ),
              ),
              Text('Nom de la rue'),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ex: rue Jean Jaures',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Filed required';
                  }
                  return null;
                },
              ),
              ),
              Text('Ville'),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ex: Saint-Etienne',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Filed required';
                  }
                  return null;
                },
              ),
              ),
              Text('Card'),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ex: 123456789122345',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Filed required';
                  }
                  return null;
                },
              ),
              ),
              Text('Cryptogramme'),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ex: 123',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Filed required';
                  }
                  return null;
                },
              ),
              ),
              Text('Date de fin de validité'),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
                child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'ex: 05/2026',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Filed required';
                  }
                  return null;
                },
              ),
              ),
              Text('Prix : ${getSum()} \n'),
              ElevatedButton(
                  onPressed: () => print('Commande validé'),
                child: Text('Valider la commande'),
              ),
            ],
          ),
          ),
        ),
      )
    );
  }

  double? getSum(){
    for (int i = 0; i < widget._cart.countItems(); i++) {
      return widget._cart.getCartItem(i).produit.price;
    }
  }
}
