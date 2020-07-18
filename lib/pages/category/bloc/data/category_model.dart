class CategoryPageData {
  final int cartCount;
  final List<Categories> categories;
  CategoryPageData(this.cartCount, this.categories);

  factory CategoryPageData.fromJson(Map<String, dynamic> json) {
    List<Categories> categoryList = new List<Categories>();

    json['categories'].forEach((v) {
      categoryList.add(new Categories.fromJson(v));
    });

    return CategoryPageData(json['cartCount'], categoryList);
  }
}

class Categories {
  final String id;
  final String name;
  final String imagePath;
  final String description;

  Categories(this.id, this.name, this.imagePath, this.description);

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      json['id'],
      json['name'],
      json['imagePath'],
      json['description'],
    );
  }
}
