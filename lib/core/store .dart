
import 'package:practice/models/CartModel.dart';
import 'package:practice/models/models.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late Products catalog;
  late Cart_model cart;

  MyStore() {
    catalog = Products();
    cart = Cart_model();
    cart.catalog = catalog;
  }
}
