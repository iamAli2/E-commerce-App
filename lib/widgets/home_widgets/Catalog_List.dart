// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:practice/pages/home_details_page.dart';
import '../../models/models.dart';
import 'Catalog_image.dart';
import 'add_to_cart.dart';

class catalogList extends StatelessWidget {
  const catalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Products.Product.length,
      itemBuilder: (context, index) {
        final items = Products.Product[index];
        return InkWell(
          child: Catalogitems(Catalog: items),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Home_details_page(catalog: items)),
            ),
          ),
        );
      },
    );
  }
}

class Catalogitems extends StatelessWidget {
  final Item Catalog;

  const Catalogitems({super.key, required this.Catalog})
      : assert(Catalog != null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(Catalog.id.toString()),
              child: CatalogImage(image: Catalog.image)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Catalog.name.text.bold.xl.color(context.accentColor).make(),
                Catalog.desc.text
                    .color(context.theme.focusColor)
                    .textStyle(context.captionStyle)
                    .make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${Catalog.price}"
                        .text
                        .bold
                        .xl
                        .color(context.theme.hintColor)
                        .make(),
                    Add_to_Cart(
                      Catalog: Catalog,
                    )
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).roundedSM.square(150).make().py16();
  }
}
