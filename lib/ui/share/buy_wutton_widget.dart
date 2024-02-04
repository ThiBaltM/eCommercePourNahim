import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_ecommerce/ui/style.dart';

class BuyButtonWidget extends StatelessWidget {
  const BuyButtonWidget({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white),
          ),
          child:
          Row(
            children: [
              Icon(Icons.shopping_cart, color: AppTheme.primaryColor,),
              SizedBox(width: 10),
              Text('Ajouter au panier',
              style: AppTheme.yellowPrimaryTextStyle.copyWith(fontWeight: FontWeight.bold),),
            ],
          ),
          onPressed: () {
            //code à ajouter pour mettre au panier
          },
        ),
      ],
    );
  }
}
