import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/models/models.dart';
import 'package:practice/widgets/home_widgets/add_to_cart.dart';
import 'package:practice/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class Home_details_page extends StatelessWidget {
  final Item catalog;

  const Home_details_page({super.key, required this.catalog})
      : assert(catalog != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.accentColor),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            Add_to_Cart(
              Catalog: catalog,
            ).wh(145, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text
                        .color(context.theme.focusColor)
                        .textStyle(context.captionStyle)
                        .xl
                        .make(),
                    10.heightBox,
                    "Diam rebum et accusam gubergren dolor takimata sanctus vero clita. Lorem dolore nonumy amet sed diam amet eirmod. Lorem sit sit ut labore no lorem stet takimata sea, justo tempor aliquyam sea invidunt et dolore takimata ea, consetetur labore lorem sadipscing invidunt diam eos at sit gubergren, sed et clita."
                        .text
                        .color(context.theme.focusColor)
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
