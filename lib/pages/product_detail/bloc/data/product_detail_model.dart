class ProductDetailModel {
  final int cartCount;
  final List<String> imagesUrl;
  final String productId;
  final String productName;
  final String category;
  final String brand;
  final String description;
  final int quantity;
  final double price;

  ProductDetailModel(
      this.cartCount,
      this.imagesUrl,
      this.productId,
      this.productName,
      this.category,
      this.brand,
      this.description,
      this.quantity,
      this.price);

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      json['cartCount'],
      json['imagesUrl'],
      json['productId'],
      json['productName'],
      json['category'],
      json['brand'],
      json['description'],
      json['quantity'],
      json['price'],
    );
  }
}
