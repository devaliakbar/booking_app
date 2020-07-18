import 'package:bookingapp/pages/products/bloc/data/products_model.dart';
import 'package:bookingapp/pages/products/product_helper.dart';

class ProductsRepo {
  Future<ProductsDatas> getProducts(ProductHelper productHelper) async {
    //FETCH FROM SERVER
    await Future.delayed(Duration(seconds: 2));

    var jsonDecoded = {
      "cartCount": 3,
      "items": [
        {
          "id": "1",
          "name": "Mutton Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 10.00,
          "cartQty": 1,
          "imagePath":
              "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528"
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
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
        },
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
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
        },
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
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
        },
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
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
        },
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
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
        },
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
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.sunbasket.com/12e70e6d-2cf6-48fd-975d-60a2387d18fd.jpg"
        },
      ]
    };

    //  throw "Json Momova";

    return ProductsDatas.fromJson(jsonDecoded);
  }
}
