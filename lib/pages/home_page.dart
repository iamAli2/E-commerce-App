import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:practice/models/CartModel.dart';
import 'package:practice/utils/my_routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/models/models.dart';
import 'package:practice/core/store .dart';
import '../widgets/home_widgets/Catalog_Header.dart';
import '../widgets/home_widgets/Catalog_List.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 3));
    final jason = await rootBundle.loadString('assets/files/data1.json');
    final decodeddata = jsonDecode(jason);
    var productsdata = decodeddata["Products"];
    Products.Product = List.from(productsdata)
        .map<Item>((items) => Item.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Material(
      child: Scaffold(
        floatingActionButton: VxBuilder(
          mutations: {RemoveMutation, AddMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, My_routes.cartpage),
            splashColor: Colors.deepPurpleAccent,
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
            ),
          ).badge(
              count: _cart.items.length,
              textStyle: TextStyle(fontSize: 12, color: Colors.white),
              color: Vx.amber900,
              size: 20),
        ),
        backgroundColor: context.canvasColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (Products.Product != null && Products.Product.isNotEmpty)
                  catalogList().expand()
                else
                  CircularProgressIndicator(
                    color: context.theme.buttonColor,
                  ).centered().expand()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
