// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:practice/core/store%20.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:practice/models/models.dart';

class Cart_model {
//Catalog Field
  late Products _catalog;

//collection of ids
  final List<int> _itemIds = [];

//Get Catalog (Items)
  Products get catalog => _catalog;

//Set Catalog
  set catalog(Products _newData) {
    assert(_newData != null);
    _catalog = _newData;
  }

//Get items in the Cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//Get total prize
  num get totalPrize =>
      items.fold(0, (total, current) => total + current.price);


}

class AddMutation extends VxMutation<MyStore> {
  final Item items;
  AddMutation({
    required this.items,
  });
  @override
  perform() {
    store!.cart._itemIds.add(items.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item items;
  RemoveMutation({
    required this.items,
  });
  @override
  perform() {
    store!.cart._itemIds.remove(items.id);
  }
}
