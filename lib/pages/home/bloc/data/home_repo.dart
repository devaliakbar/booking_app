import 'package:bookingapp/pages/home/bloc/data/home_model.dart';

class HomeRepo {
  Future<HomePageDatas> getHomePageDatas() async {
//FETCH FROM SERVER
    await Future.delayed(Duration(milliseconds: 100));

    var jsonDecoded = {
      "bannersPath": [
        "https://www.dboyzfashion.com/wp-content/uploads/2016/06/adidas-originals-shoes-banner.jpg",
        "https://i.pinimg.com/originals/18/d4/70/18d470b3a5acaf907fe121ca703fceff.jpg",
        "https://kwietstorms.files.wordpress.com/2015/02/yeezy-adidas-banner1.jpg",
      ],
      "cartCount": 3,
      "categories": [
        {
          "id": "1",
          "name": "Women",
          "imagePath":
              "https://upload.wikimedia.org/wikipedia/commons/9/91/Gigi_Hadid._2015.jpg"
        },
        {
          "id": "2",
          "name": "Men",
          "imagePath":
              "https://i.pinimg.com/originals/61/1f/4a/611f4aea5e7def951de65b73badae5d9.png"
        },
        {
          "id": "3",
          "name": "Suits",
          "imagePath":
              "https://hdwallpaperim.com/wp-content/uploads/2017/08/26/172772-men-suits.jpg"
        },
        {
          "id": "4",
          "name": "T-Shirt",
          "imagePath":
              "https://onpointfresh.com/wp-content/uploads/2020/01/46409342_2270792776494762_1646210547843201276_n-819x1024.jpg"
        },
        {
          "id": "5",
          "name": "Shorts",
          "imagePath":
              "https://i.pinimg.com/564x/46/de/57/46de57d80c957626a6bdbad8976aa544.jpg"
        },
        {
          "id": "6",
          "name": "Sunglasses",
          "imagePath":
              "https://shadesdaddyblog.com/wp-content/uploads/2016/03/cm1.jpg"
        },
        {
          "id": "4",
          "name": "T-Shirt",
          "imagePath":
              "https://onpointfresh.com/wp-content/uploads/2020/01/46409342_2270792776494762_1646210547843201276_n-819x1024.jpg"
        },
        {
          "id": "5",
          "name": "Shorts",
          "imagePath":
              "https://i.pinimg.com/564x/46/de/57/46de57d80c957626a6bdbad8976aa544.jpg"
        },
        {
          "id": "6",
          "name": "Sunglasses",
          "imagePath":
              "https://shadesdaddyblog.com/wp-content/uploads/2016/03/cm1.jpg"
        },
        {
          "id": "1",
          "name": "Shoes",
          "imagePath":
              "https://www.bosshunting.com.au/wp-content/uploads/2020/03/Stefano-Bemer-Shoes-1-1027x560.jpg"
        },
        {
          "id": "2",
          "name": "Backpack",
          "imagePath":
              "https://i1.wp.com/rohayati.com/wp-content/uploads/2019/10/Women-Backpack-Cute.jpg?resize=1080%2C1024&ssl=1"
        },
        {
          "id": "3",
          "name": "Suits",
          "imagePath":
              "https://hdwallpaperim.com/wp-content/uploads/2017/08/26/172772-men-suits.jpg"
        },
      ],
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
      ]
    };

    //  throw "Json Momova";

    return HomePageDatas.fromJson(jsonDecoded);
  }
}
