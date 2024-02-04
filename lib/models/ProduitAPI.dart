import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:td_ecommerce/models/produit.dart';

class ProduitAPI {
  String url;
  ProduitAPI(this.url);

  Future<List<Produit>> getProduits() async {
    final response = await http.get(Uri.parse(this.url));

    if (response.statusCode == 200) {
      // Utiliser Utf8Decoder pour interpréter la réponse en UTF-8
      final List<dynamic> data = json.decode(Utf8Decoder().convert(response.bodyBytes));
      return data.map((json) =>
          Produit(
              int.parse(json['id']),
              json['title'],
              json['image'],
              json['price'],
              json['size'],
              json['collection']
          )).toList();
    } else {
      return [];
    }
  }
}
