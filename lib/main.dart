import 'package:flutter/material.dart';
import 'package:practice/core/store%20.dart';
import 'package:practice/pages/cart_page.dart';
import 'package:practice/pages/home_page.dart';
import 'package:practice/pages/login_page.dart';
import 'package:practice/utils/my_routes.dart';
import 'package:practice/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main(List<String> args) {
  runApp(VxState(store: MyStore(), child: Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: themedata.darktheme(context),
      theme: themedata.lighttheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: My_routes.homepage,
      routes: {
        My_routes.loginpage: (context) => loginpage(),
        My_routes.homepage: (context) => Homepage(),
        My_routes.cartpage: (context) => CartPage(),
      },
    );
  }
}
