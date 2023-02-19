import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:practice/widgets/theme.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image}) : assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.network(
        image,
      ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context),
    );
  }
}
