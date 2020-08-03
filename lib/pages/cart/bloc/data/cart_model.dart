class CartDatas {
  final int cartCount;

  final double shippingCost;
  final double total;
  final List<ItemDetails> items;

  CartDatas(this.cartCount, this.shippingCost, this.total, this.items);

  factory CartDatas.fromJson(Map<String, dynamic> json) {
    List<ItemDetails> itemDetails = new List<ItemDetails>();

    json['items'].forEach((v) {
      itemDetails.add(new ItemDetails.fromJson(v));
    });

    return CartDatas(
        json['cartCount'], json['shippingCost'], json['total'], itemDetails);
  }
}

class ItemDetails {
  final String id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final double cartQty;
  final String imagePath;

  ItemDetails(this.id, this.name, this.brand, this.category, this.price,
      this.cartQty, this.imagePath);

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(
        json['id'],
        json['name'],
        json['brand'],
        json['category'],
        double.parse(json['price'].toString()),
        double.parse(json['cartQty'].toString()),
        json['imagePath']);
  }
}
