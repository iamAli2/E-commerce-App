import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/core/store%20.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/CartModel.dart';
import '../../models/models.dart';

class Add_to_Cart extends StatelessWidget {
  final Item Catalog;
  Add_to_Cart({
    Key? key,
    required this.Catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final Cart_model _cart = (VxState.store as MyStore).cart;
    final Products _catalog = (VxState.store as MyStore).catalog;
    bool IsinCart = _cart.items.contains(Catalog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        onPressed: () {
          if (!IsinCart) {
            AddMutation(items: Catalog);
          }
        },
        child:
            IsinCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
