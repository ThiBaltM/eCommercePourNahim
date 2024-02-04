import 'package:td_ecommerce/models/produit.dart';

class CartItem {
  final Produit produit;
  int quantity;

  CartItem(this.produit, [this.quantity = 1]);
}

class Cart {
  List<CartItem> _items = [];

  int countItems() { return _items.length; }

  CartItem getCartItem(int index) {
    return _items[index];
  }

  void addArticle(Produit produit) {
    int index = findCartItemIndex(produit.id);
    if(index == -1) {
      _items.add(CartItem(produit));
    } else {
      CartItem item = _items[index];
      item.quantity ++;
    }
  }

  List<CartItem> getItems(){return _items;}

  void removeArticle(Produit produit) {
    int index = findCartItemIndex(produit.id);
    if(index == -1) {
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.produit.id == id);
  }
}