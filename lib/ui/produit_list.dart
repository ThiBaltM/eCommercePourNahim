import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/produit.dart';
import 'package:td_ecommerce/ui/produitDetails.dart';
import 'package:td_ecommerce/ui/share/buy_wutton_widget.dart';

class ProduitList extends StatefulWidget {
  const ProduitList({super.key});

  @override
  State<ProduitList> createState() => _ProduitListState();
}

class _ProduitListState extends State<ProduitList> {
  List<Produit> _produits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Oeuvres'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: _produits.length,
          itemBuilder: (context, index) {
            return _buildRow(_produits[index]);
          }
      ),
    );
  }
  _buildRow(Produit produit){
    return Card(
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadius.vertical(
            bottom:Radius.circular(10.0), top:Radius.circular(2.0)
        ),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context)=>ProduitDetails(produit),
                ),
              );
            },
            child:_buildProduitDetails(produit),
          ),
          BuyButtonWidget(),
        ],
      ),
    );
  }

  _buildProduitDetails(Produit produit){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(produit.title),
          subtitle: Text(produit.collection),
        ),
        Image.asset(
          '${produit.image}',
          height:120,
          width:MediaQuery.of(context).size.width,
          fit:BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child:Text(produit.size),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            child:Text('${produit.price}€'),
        ),
      ],
    );
  }


}
