import 'package:bookingapp/pages/home/bloc/data/home_model.dart';

class HomeRepo {
  Future<HomePageDatas> getHomePageDatas() async {
//FETCH FROM SERVER
    await Future.delayed(Duration(seconds: 2));

    var jsonDecoded = {
      "bannersPath": [
        "https://www.dboyzfashion.com/wp-content/uploads/2016/06/adidas-originals-shoes-banner.jpg",
        "https://i.pinimg.com/originals/18/d4/70/18d470b3a5acaf907fe121ca703fceff.jpg",
        "https://kwietstorms.files.wordpress.com/2015/02/yeezy-adidas-banner1.jpg",
      ],
      "cartCount": 3,
      "categories": [
        {
          "name": "Shoes",
          "imagePath":
              "https://www.pngfind.com/pngs/m/48-480758_jordan-shoes-png-best-jordan-shoes-transparent-png.png"
        },
        {
          "name": "Backpack",
          "imagePath":
              "https://www.slamjam.com/dw/image/v2/BDHR_PRD/on/demandware.static/-/Sites-catalog-slamjam-master/default/dwed6253fd/hi-res/AAUBA0006FA01_S20-BLK0001_01.png?sw=1000&sh=1250"
        },
        {
          "name": "Suits",
          "imagePath":
              "https://w7.pngwing.com/pngs/1005/532/png-transparent-tuxedo-suit-formal-wear-men-s-suits-black-notched-lapel-suit-blazer-illustration-men-suit-necktie-cartoon.png"
        },
        {
          "name": "T-Shirt",
          "imagePath":
              "https://i.ya-webdesign.com/images/navy-blue-tshirt-png-2.png"
        },
        {
          "name": "Shorts",
          "imagePath":
              "https://www.slamjam.com/dw/image/v2/BDHR_PRD/on/demandware.static/-/Sites-catalog-slamjam-master/default/dwc06e8780/hi-res/MO7215L0299_S20-V0060_01.png?sw=1000&sh=1250"
        },
        {
          "name": "Sunglasses",
          "imagePath":
              "https://pluspng.com/img-png/sunglass-png-aviator-sunglass-png-clipart-3381.png"
        },
      ],
      "items": [
        {
          "id": "1",
          "name": "Yeezy",
          "brand": "Adidas",
          "category": "Shoes",
          "price": 400.00,
          "cartQty": 1,
          "imagePath":
              "https://www.kindpng.com/picc/m/244-2441559_adidas-yeezy-boost-350-turtle-dove-transparent-background.png"
        },
        {
          "id": "7",
          "name": "Black Grey",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 588.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/gucci-glasses-png-16.png"
        },
        {
          "id": "8",
          "name": "GG0036S",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 350.00,
          "cartQty": 1,
          "imagePath":
              "https://ya-webdesign.com/images600_/gucci-glasses-png-1.png"
        },
        {
          "id": "6",
          "name": "S Gold",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 345.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/gucci-glasses-png-8.png"
        },
        {
          "id": "5",
          "name": "C Blue",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/cool-sunglasses-png.png"
        },
        {
          "id": "3",
          "name": "Classic",
          "brand": "Adidas",
          "category": "Backpack",
          "price": 58.00,
          "cartQty": 1,
          "imagePath":
              "https://www.slamjam.com/dw/image/v2/BDHR_PRD/on/demandware.static/-/Sites-catalog-slamjam-master/default/dwb6e1cfd0/hi-res/GF3197_S20-001_01.png?sw=400&sh=500"
        },
        {
          "id": "9",
          "name": "Men Black",
          "brand": "Gucci",
          "category": "Suits",
          "price": 2900.00,
          "cartQty": 0,
          "imagePath": "https://pngimg.com/uploads/suit/suit_PNG93204.png"
        },
        {
          "id": "10",
          "name": "Essential",
          "brand": "Brioni",
          "category": "Suits",
          "price": 3950,
          "cartQty": 1,
          "imagePath": "https://i.dlpng.com/static/png/299709_preview.png"
        },
        {
          "id": "2",
          "name": "Men Blue",
          "brand": "Adidas",
          "category": "T-Shirt",
          "price": 38.00,
          "cartQty": 0,
          "imagePath":
              "https://i.ya-webdesign.com/images/navy-blue-tshirt-png-2.png"
        },
        {
          "id": "4",
          "name": "Sweatshorts",
          "brand": "Adidas",
          "category": "Shorts",
          "price": 28.00,
          "cartQty": 0,
          "imagePath":
              "https://www.slamjam.com/dw/image/v2/BDHR_PRD/on/demandware.static/-/Sites-catalog-slamjam-master/default/dwa9a7c665/hi-res/DY3265_S19-001_01.png?sw=1000&sh=1250"
        },
        {
          "id": "5",
          "name": "C Blue",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/cool-sunglasses-png.png"
        },
        {
          "id": "7",
          "name": "Black Grey",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 588.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/gucci-glasses-png-16.png"
        },
        {
          "id": "8",
          "name": "GG0036S",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 350.00,
          "cartQty": 1,
          "imagePath":
              "https://ya-webdesign.com/images600_/gucci-glasses-png-1.png"
        },
        {
          "id": "6",
          "name": "S Gold",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 345.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/gucci-glasses-png-8.png"
        },
        {
          "id": "1",
          "name": "Yeezy",
          "brand": "Adidas",
          "category": "Shoes",
          "price": 400.00,
          "cartQty": 1,
          "imagePath":
              "https://www.kindpng.com/picc/m/244-2441559_adidas-yeezy-boost-350-turtle-dove-transparent-background.png"
        },
        {
          "id": "5",
          "name": "C Blue",
          "brand": "Gucci",
          "category": "Sunglasses",
          "price": 700.00,
          "cartQty": 0,
          "imagePath":
              "https://ya-webdesign.com/images600_/cool-sunglasses-png.png"
        },
      ]
    };

    //  throw "Json Momova";

    return HomePageDatas.fromJson(jsonDecoded);
  }
}
