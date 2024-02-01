import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/produit.dart';
import 'package:td_ecommerce/ui/share/buy_wutton_widget.dart';
import 'package:td_ecommerce/ui/style.dart';

class ProduitDetails extends StatefulWidget {
  Produit produit;
  ProduitDetails(this.produit,{Key? key}):super(key:key);

  @override
  State<ProduitDetails> createState() => _ProduitDetailsState();
}

class _ProduitDetailsState extends State<ProduitDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produit.title),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          Text("L'oeuvre${widget.produit.title}",
          style: AppTheme.headingTextStyle,),
          Image.asset(
            "${widget.produit.image}",
            width: 180,
          ),
          Text(
            "Taille",
            style: AppTheme.headingTextStyle,

          ),
          Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 12.0 ),
            child: Text(
              widget.produit.size,
            ),

      ),
         Text(
                "Collection",
                style: AppTheme.headingTextStyle,
                ),
          Padding(padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
          child: Text(
              widget.produit.collection,
    ),
                ),
        Text('Prix : '
          , style: AppTheme.priceTextStyle,
        ),
          Padding(padding: EdgeInsets.only(top: 8.0,bottom: 12.0),
          child: Text(
            '${widget.produit.price}',
          ),
          ),
          BuyButtonWidget(),
    ],
    ),
    );
  }
}
