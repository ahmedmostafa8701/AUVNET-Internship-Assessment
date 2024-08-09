class Product{
  final String name;
  final String ?description;
  final double price;
  final String image;

  Product({required this.name, this.description, required this.price, required this.image});
}
class ProductList{
  static List<Product> products = [
    Product(
      name: 'fridge',
      description: 'This is a fridge',
      price: 500.0,
      image: 'assets/fridge.jpg',
    ),
    Product(
      name: 'washing machine',
      description: 'This is a washing machine',
      price: 500.0,
      image: 'assets/washing machine.jpg',
    ),
  ];
}