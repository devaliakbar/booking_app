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
          "name": "White",
          "brand": "Gigi",
          "category": "Shoes",
          "price": 400.00,
          "cartQty": 1,
          "imagePath":
              "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=%5B490%2C165%5D&w=1000&h=1333&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F04%2F30%2Fgigi-hadid-8.jpg"
        },
        {
          "id": "7",
          "name": "White",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 588.00,
          "cartQty": 0,
          "imagePath": "https://img.shopperboard.com/324843/56949098de04b.jpg"
        },
        {
          "id": "6",
          "name": "Grey",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 345.00,
          "cartQty": 0,
          "imagePath": "https://img.shopperboard.com/81069/5467272feee36.jpg"
        },
        {
          "id": "5",
          "name": "Cream",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://media1.popsugar-assets.com/files/thumbor/HtRumHb1PxzmuGKViWb5lhb2UZ4/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2019/02/27/659/n/1922564/6442633195d35b88_GettyImages-1132465769/i/Gigi-Hadid-Fashion-Week-Fall-2019.jpg"
        },
        {
          "id": "4",
          "name": "Dark Grey",
          "brand": "Gucci",
          "category": "Shorts",
          "price": 28.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.lookastic.com/charcoal-bodycon-dress/classic-bodycon-dress-original-368956.jpg"
        },
        {
          "id": "5",
          "name": "C Blue",
          "brand": "Prada",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://5.imimg.com/data5/SL/KT/MY-16099781/tesla-blue-500x500.jpg"
        },
        {
          "id": "1",
          "name": "White",
          "brand": "Gigi",
          "category": "Shoes",
          "price": 400.00,
          "cartQty": 1,
          "imagePath":
              "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=%5B490%2C165%5D&w=1000&h=1333&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F04%2F30%2Fgigi-hadid-8.jpg"
        },
        {
          "id": "7",
          "name": "White",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 588.00,
          "cartQty": 0,
          "imagePath": "https://img.shopperboard.com/324843/56949098de04b.jpg"
        },
        {
          "id": "6",
          "name": "Grey",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 345.00,
          "cartQty": 0,
          "imagePath": "https://img.shopperboard.com/81069/5467272feee36.jpg"
        },
        {
          "id": "5",
          "name": "Cream",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://media1.popsugar-assets.com/files/thumbor/HtRumHb1PxzmuGKViWb5lhb2UZ4/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2019/02/27/659/n/1922564/6442633195d35b88_GettyImages-1132465769/i/Gigi-Hadid-Fashion-Week-Fall-2019.jpg"
        },
        {
          "id": "4",
          "name": "Dark Grey",
          "brand": "Gucci",
          "category": "Shorts",
          "price": 28.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.lookastic.com/charcoal-bodycon-dress/classic-bodycon-dress-original-368956.jpg"
        },
        {
          "id": "5",
          "name": "C Blue",
          "brand": "Prada",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://5.imimg.com/data5/SL/KT/MY-16099781/tesla-blue-500x500.jpg"
        },
        {
          "id": "1",
          "name": "White",
          "brand": "Gigi",
          "category": "Shoes",
          "price": 400.00,
          "cartQty": 1,
          "imagePath":
              "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=%5B490%2C165%5D&w=1000&h=1333&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F04%2F30%2Fgigi-hadid-8.jpg"
        },
        {
          "id": "7",
          "name": "White",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 588.00,
          "cartQty": 0,
          "imagePath": "https://img.shopperboard.com/324843/56949098de04b.jpg"
        },
        {
          "id": "6",
          "name": "Grey",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 345.00,
          "cartQty": 0,
          "imagePath": "https://img.shopperboard.com/81069/5467272feee36.jpg"
        },
        {
          "id": "5",
          "name": "Cream",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://media1.popsugar-assets.com/files/thumbor/HtRumHb1PxzmuGKViWb5lhb2UZ4/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2019/02/27/659/n/1922564/6442633195d35b88_GettyImages-1132465769/i/Gigi-Hadid-Fashion-Week-Fall-2019.jpg"
        },
        {
          "id": "4",
          "name": "Dark Grey",
          "brand": "Gucci",
          "category": "Shorts",
          "price": 28.00,
          "cartQty": 0,
          "imagePath":
              "https://cdn.lookastic.com/charcoal-bodycon-dress/classic-bodycon-dress-original-368956.jpg"
        },
        {
          "id": "5",
          "name": "C Blue",
          "brand": "Prada",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://5.imimg.com/data5/SL/KT/MY-16099781/tesla-blue-500x500.jpg"
        },
      ]
    };

    //  throw "Json Momova";

    return ProductsDatas.fromJson(jsonDecoded);
  }
}
