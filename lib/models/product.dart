enum ProductType {
  clothing("Clothing"),
  merchandise("Merchandise"),
  popular("Popular");

  const ProductType(this.displayName);
  final String displayName;
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
