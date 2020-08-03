import 'package:bookingapp/pages/product_detail/bloc/data/product_detail_model.dart';

class ProductDetailRepo {
  Future<ProductDetailModel> getProductDetail(String productId) async {
    //FETCH FROM SERVER
    await Future.delayed(Duration(milliseconds: 1500));

    var jsonDecoded = {
      "cartCount": 3,
      "productId": "10",
      "productName": "Product Name",
      "category": "Category",
      "brand": "Brand",
      "description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "quantity": 5,
      "price": 10.00,
      "imagesUrl": [
        "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528",
        "https://cnet4.cbsistatic.com/img/PqmCA2aJUqYBcBtAdMd-R4yu-Eo=/940x0/2020/05/31/5f00f7b1-425b-4cbc-9663-ea84ecf3c94c/gettyimages-962701814.jpg",
        "https://try-sunbasket-staging-assets.s3-us-west-2.amazonaws.com/2018/08/sicilian-chicken-broccoli.jpg",
        "https://try-sunbasket-staging-assets.s3-us-west-2.amazonaws.com/2018/08/salmon-green-romesco.jpg",
        "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
      ]
    };

    //  throw "Json Momova";

    return ProductDetailModel.fromJson(jsonDecoded);
  }
}
