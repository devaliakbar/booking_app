import 'package:bookingapp/pages/cart/bloc/data/cart_model.dart';

class CartRepo {
  Future<CartDatas> getCartDatas() async {
    //FETCH FROM SERVER
    await Future.delayed(Duration(milliseconds: 100));

    var jsonDecoded = {
      "cartCount": 3,
      "shippingCost": 50.00,
      "total": 300.00,
      "items": [
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/57be3bb0-6d9d-4761-af3f-c3399f8c2864.jpg"
        },
        {
          "id": "2",
          "name": "Chicken Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 5.00,
          "cartQty": 0,
          "imagePath":
              "https://cnet4.cbsistatic.com/img/PqmCA2aJUqYBcBtAdMd-R4yu-Eo=/940x0/2020/05/31/5f00f7b1-425b-4cbc-9663-ea84ecf3c94c/gettyimages-962701814.jpg"
        },
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://try-sunbasket-staging-assets.s3-us-west-2.amazonaws.com/2018/08/sicilian-chicken-broccoli.jpg"
        },
        {
          "id": "2",
          "name": "Chicken Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 5.00,
          "cartQty": 0,
          "imagePath":
              "https://try-sunbasket-staging-assets.s3-us-west-2.amazonaws.com/2018/08/salmon-green-romesco.jpg"
        },
      ]
    };

    //  throw "Json Momova";

    return CartDatas.fromJson(jsonDecoded);
  }
}
