import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Panier extends StatefulWidget {

  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildRow(context);
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
              Text('Total'),
              Text('30 €'),
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

  _buildRow(BuildContext context) {
    return Card(
      child:
      Column(
        children: [
          Text(
            'Titre',
            style: _style('titre'),
          ),
          Image.asset(
            'assets/images/laNuitEtoilee.jpg',
            height: 250,
          ),
          Text('Price'),
        ],
      ),

    );
  }

  _style(arg) {
    final base = const TextStyle();

    if(arg == 'titre') {
      final titre = base.copyWith(
        fontSize: 22.0,
        fontFamily: 'Montserrat',
      );
      return titre;
    }
  }
}
