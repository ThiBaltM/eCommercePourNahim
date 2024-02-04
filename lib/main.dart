import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/ProduitAPI.dart';
import 'package:td_ecommerce/models/produit.dart';
import 'package:td_ecommerce/models/Cart.dart';
import 'package:td_ecommerce/ui/notify.dart';
import 'package:td_ecommerce/ui/panier.dart';

import 'models/ProduitList.dart';
import 'package:td_ecommerce/ui/produitDetails.dart';
import 'package:td_ecommerce/ui/style.dart';
import 'package:in_app_notification/in_app_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MaterialApp(
        title: 'In-App Notification Demo',
        home: MyHomePage(title: 'is good'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Cart _cart;


  MyHomePage({super.key, required this.title}) : _cart = Cart();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Produit>> produitsFuture =ProduitAPI('https://65b907e2b71048505a8a06c0.mockapi.io/api/prints').getProduits();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Panier(widget._cart)),
              );
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: AppTheme.primaryColor,
        title: Text("Art by chiara"),
      ),
      body:
        Center(
        child:FutureBuilder<List<Produit>>(
          future:produitsFuture,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }else if(snapshot.hasData){
              final produits = snapshot.data!;
              return _buildProduitList(produits);
            }else{
              return const Text("Nous n'avons plus de produits pour le moment.",);
            }
          },
        )

      ),
    );
  }

  _buildProduitList(List<Produit> produits){
    return ListView.builder(
      itemCount: produits.length,
      itemBuilder: (context,index){
        final produit = produits[index];
        return Container(
          color:AppTheme.primaryColor,
          margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      widget._cart.addArticle(produit);
                      InAppNotification.show(
                        child: NotificationBody(count: 2000, text: 'article ajouté',),
                        context: context,
                        //onTap: () => print('Notification tapped!'),
                      );
                    },
                    child: Icon(Icons.add_shopping_cart),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProduitDetails(produit, widget._cart)));
                    },
                    child: Icon(Icons.info),
                  ),
                  ]
                ),

              Expanded(flex: 1, child: Image.network(produit.image)),

              SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produit.title,
                      style: AppTheme.headingTextStyle,
                    ),
                  SizedBox(height: 3),
                  Text(
                  "Size: ${produit.size}",
                  style: AppTheme.primaryTextStyle
                  ),
                  Text(
                  "Collection: ${produit.collection}",
                  style: AppTheme.primaryTextStyle
                ),

                ],
              ),
        ),Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${produit.price} €",
                      style: AppTheme.priceTextStyle
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
