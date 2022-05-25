class Product {
  int id;
  String name;
  String description;
  String image;
  int categoryId;
  int inventory;
  String price;
  int proveedor;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.inventory,
    required this.price,
    required this.proveedor,
  });

  static Product fromJson(Map json) {
    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      categoryId: json["categoryId"],
      inventory: json["inventory"],
      price: json["price"],
      proveedor: json["proveedor"],
    );
  }
}
