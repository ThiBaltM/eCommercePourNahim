import 'package:flutter/cupertino.dart';
import 'package:td_ecommerce/models/produit.dart';

class ProduitDetails extends StatefulWidget {
  Produit produit;
  ProduitDetails(this.produit,{Key? key}):super(key:key);

  @override
  State<ProduitDetails> createState() => _ProduitDetailsState();
}

class _ProduitDetailsState extends State<ProduitDetails> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
