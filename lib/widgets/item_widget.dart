import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/models/models.dart';

class itemWidget extends StatelessWidget {
  final Item item;

  // ignore: unnecessary_null_comparison
  const itemWidget({super.key, required this.item}) : assert(item != null);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        shape: StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListTile(
            onTap: () {
              print("${item.price} pressed");
            },
            leading: Image.network(item.image),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text(
              "\$${item.price}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                  fontFamily: GoogleFonts.laila().fontFamily),
              textScaleFactor: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
