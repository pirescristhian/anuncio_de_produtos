class Product {
  int? code;
  String? name;
  String? price;

  Product({
    this.code,
    this.name,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': this.code,
      'name': this.name,
      'price': this.price,
    };
  }

  static Product toObject(Map<String, dynamic> data) {
    return Product(
      code: data["code"],
      name: data["name"],
      price: data["price"],
    );
  }
}
