import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/Cart.dart';
import 'package:td_ecommerce/ui/style.dart';

class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        title: Text('Panier'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                ),
                itemCount: widget._cart.countItems(),
                itemBuilder: (context, index) {
                  return _buildRow(widget._cart.getCartItem(index), context);
                }
            ),
            /*child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildRow(context);
              },
            ),*/
          ),
          Row(
            children: [
              Text('Total : ',
                style: AppTheme.priceTextStyle,
              ),
              Text('${this.getSum()} €',
                style: AppTheme.priceTextStyle,
              ),
            ],
          ),
          Container(
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: () {
                print('Valider');
              },
            ),
          )
        ],
      ),
    );
  }

  double? getSum(){
    for (int i = 0; i < widget._cart.countItems(); i++) {
      return widget._cart.getCartItem(i).produit.price * widget._cart.getCartItem(i).quantity;
    }
  }

  _buildRow(CartItem cartItem, BuildContext context) {

    return Card(
      margin: EdgeInsets.all(1.0),
      color: AppTheme.primaryColor,
      child:
      Column(
        children: [
          Text(
            '${cartItem.produit.title} \n',
            style: AppTheme.headingTextStyle,
          ),
          Image.network(
            cartItem.produit.image,
            height: 250,
          ),
          Text('Collection : ${cartItem.produit.collection} \n',
            style: AppTheme.primaryTextStyle,
          ),
          Text('Size : ${cartItem.produit.size} \n',
            style: AppTheme.primaryTextStyle,
          ),
          Text('${cartItem.produit.price.toString()} €',
            style: AppTheme.priceTextStyle,
          ),
        ],
      ),
    );
  }
}
