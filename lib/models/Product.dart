class Product {

  int id;
  String name;
  String price;

  Product({
      required this.id,
      required this.name,
      required this.price,
  });

  Product.fromJson(Map<String, dynamic> json):
          id = json['id'],
          name = json['name'],
          price = json['price'];

}