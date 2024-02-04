import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/produit.dart';
import 'package:td_ecommerce/ui/share/buy_wutton_widget.dart';
import 'package:td_ecommerce/ui/style.dart';

class ProduitDetails extends StatefulWidget {
  Produit produit;
  ProduitDetails(this.produit, {Key? key}) : super(key: key);

  @override
  State<ProduitDetails> createState() => _ProduitDetailsState();
}

class _ProduitDetailsState extends State<ProduitDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        title: Text(widget.produit.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image à gauche
            Expanded(
              flex: 1,
              child: Image.network(
                widget.produit.image,
                fit: BoxFit.contain, // Conserve les proportions d'origine
              ),
            ),
            SizedBox(width: 16.0), // Espace entre l'image et les informations
            // Informations à droite
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.produit.title,
                    style: AppTheme.headingTextStyle,
                  ),
                  Text(
                    "Taille : ${widget.produit.size}",
                    style: AppTheme.yellowPrimaryTextStyle,
                  ),
                  Text(
                    "Collection : ${widget.produit.collection}",
                    style: AppTheme.yellowPrimaryTextStyle,
                  ),
                  Text(
                    '${widget.produit.price} €',
                    style: AppTheme.priceTextStyle.copyWith(color: AppTheme.primaryColor),
                  ),
                  BuyButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
