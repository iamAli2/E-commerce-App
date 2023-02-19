import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Products {
  static List<Item> Product = [];

  Item getById(int id) =>
      Product.firstWhere((element) => element.id == id, orElse: null);
  Item getByPosition(int pos) => Product[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  );

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as int,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as num,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image,)';
  }
}
