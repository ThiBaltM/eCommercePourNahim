import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/Cart.dart';
import 'package:td_ecommerce/ui/style.dart';
//test
class Panier extends StatefulWidget {
  final Cart _cart;

  const Panier(this._cart, {super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    double total = 0;
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
                  total += widget._cart.getCartItem(index).produit.price;
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
              Text('${total} €',
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

  _buildRow(CartItem cartItem, BuildContext context) {
    return Card(
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
            height: 350,
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
