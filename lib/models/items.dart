// import 'dart:convert';

// class Item {
//   String id;
//   String name;
//   String description;
//   String price;
//   String category;
//   String section;
//   String favorites;
//   String image;

//   Item({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.category,
//     required this.section,
//     required this.favorites,
//     required this.image,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'description': description,
//       'price': price,
//       'category': category,
//       'section': section,
//       'favorites': favorites,
//       'image': image,
//     };
//   }

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(
//       id: map['id'] ?? '',
//       name: map['name'] ?? '',
//       description: map['description'] ?? '',
//       price: map['price'] ?? '',
//       category: map['category'] ?? '',
//       section: map['section'] ?? '',
//       favorites: map['favorites'] ?? '',
//       image: map['image'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
// }

class Item {
  String id;
  String name;
  String description;
  String price;
  String category;
  String section;
  String favorites;
  String image;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.section,
    required this.favorites,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      section: json['section'],
      favorites: json['favorites'],
      image: json['image'],
    );
  }
}
