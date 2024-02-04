import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/Cart.dart';
import 'package:td_ecommerce/ui/notify.dart';
import 'package:td_ecommerce/ui/style.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:td_ecommerce/models/produit.dart';

class BuyButtonWidget extends StatelessWidget {
  final Cart _cart;
  final Produit produit;

  BuyButtonWidget(this._cart, this.produit, {super.key});

  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white),
          ),
          child:
          Row(
            children: [
              Icon(Icons.shopping_cart, color: AppTheme.primaryColor,),
              SizedBox(width: 10),
              Text('Ajouter au panier',
              style: AppTheme.yellowPrimaryTextStyle.copyWith(fontWeight: FontWeight.bold),),
            ],
          ),
          onPressed: () {
            this._cart.addArticle(produit);
            InAppNotification.show(
              child: NotificationBody(count: 2000, text: 'article ajouté',),
              context: context,
              //onTap: () => print('Notification tapped!'),
            );
          },
        ),
      ],
    ),
    );
  }
}