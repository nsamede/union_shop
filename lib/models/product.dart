enum ProductType {
  clothing,
  merchandise,
  popular,
}

class Product {
  final String title;
  final double price;
  final String imageUrl;
  final List<ProductType> productTypes;

  Product(
      {required this.title,
      required this.price,
      required this.imageUrl,
      required this.productTypes});
}
