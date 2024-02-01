import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/ProduitAPI.dart';
import 'package:td_ecommerce/models/produit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Halloweens shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  MyHomePage({super.key, required this.title});

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Art by chiara"),
      ),
      body: Center(
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
          color:Colors.grey.shade300,
          margin:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child:Row(
            children: [
              Expanded(flex:1, child: Image.network(produit.image)),
              SizedBox(width:10),
              Expanded(flex:3,child:Text(
                produit.title,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              )),
            ],
          ),
        );
      },
    );
  }


}
