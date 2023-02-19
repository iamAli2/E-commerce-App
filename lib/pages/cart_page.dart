import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/CartModel.dart';
import 'package:practice/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store .dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make(),
      ),
      body: Column(
        children: [cartlist().p32().expand(), Divider(), _cartTotal()],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart_model _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              builder: (context, store, status) {
                return "\$${_cart.totalPrize}"
                    .text
                    .xl5
                    .color(context.theme.hintColor)
                    .make();
              },
              mutations: {RemoveMutation}),
          ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying does not support yet".text.make()));
                  },
                  icon: Icon(CupertinoIcons.shopping_cart),
                  label: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class cartlist extends StatelessWidget {
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final Cart_model _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to Show".text.color(context.accentColor).xl4.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  title: _cart.items[index].name.text
                      .color(context.accentColor)
                      .make(),
                  leading: Icon(
                    Icons.done_outline_rounded,
                    color: context.accentColor,
                  ),
                  trailing: IconButton(
                      color: context.accentColor,
                      icon: Icon(Icons.remove_circle_outline_rounded),
                      onPressed: () => RemoveMutation(items: _cart.items[index])
                      // setState(() {});

                      ),
                )),
          );
  }
}
