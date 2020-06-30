class HomePageDatas {
  final List<String> bannersPath;
  final int cartCount;
  final List<Categories> categories;
  final List<ItemDetails> items;

  HomePageDatas(this.bannersPath, this.cartCount, this.categories, this.items);

  factory HomePageDatas.fromJson(Map<String, dynamic> json) {
    List<ItemDetails> itemDetails = new List<ItemDetails>();

    json['items'].forEach((v) {
      itemDetails.add(new ItemDetails.fromJson(v));
    });

    List<Categories> categoryList = new List<Categories>();

    json['categories'].forEach((v) {
      categoryList.add(new Categories.fromJson(v));
    });

    return HomePageDatas(
        json['bannersPath'], json['cartCount'], categoryList, itemDetails);
  }
}

class ItemDetails {
  final String id;
  final String name;
  final String brand;
  final String category;
  final double price;
  final double cartQty;

  ItemDetails(
      this.id, this.name, this.brand, this.category, this.price, this.cartQty);

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return ItemDetails(json['id'], json['name'], json['brand'],
        json['category'], json['price'], json['cartQty']);
  }
}

class Categories {
  final String name;
  final String imagePath;

  Categories(this.name, this.imagePath);

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      json['name'],
      json['imagePath'],
    );
  }
}
