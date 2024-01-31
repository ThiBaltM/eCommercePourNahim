import 'package:flutter/material.dart';
import 'package:td_ecommerce/models/ProduitsList.dart';
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
  List<Produit> liste_prod = [];
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  var Produits = ProduitAPI('https://65b907e2b71048505a8a06c0.mockapi.io/api/prints');

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  Future<void> loadProduits()async{
    this.liste_prod = await this.Produits.getProduits();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Art by chiara"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount:  widget.liste_prod.length,
          itemBuilder: (context, index) => InkWell(
            onTap: (){
              switch (widget.liste_prod[index].id){
                case 2 :
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> ProduitList()));
                  break;
              }
            },
            child: _buildRow(widget.liste_prod[index]),
          ),
          itemExtent: 180,
        ),
      ),
    );
  }

  _buil


}
