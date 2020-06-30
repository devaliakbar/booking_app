import 'package:bookingapp/pages/home/bloc/data/home_model.dart';

class HomeRepo {
  Future<HomePageDatas> getHomePageDatas() async {
//FETCH FROM SERVER
    await Future.delayed(Duration(seconds: 4));

    var jsonDecoded = {
      "bannersPath": [
        "https://image.freepik.com/free-psd/bio-food-banner-template-with-photo_23-2148211570.jpg",
        "https://i.pinimg.com/originals/68/72/af/6872af27c6d91f16d651fe2b747bced1.jpg",
        "https://cdn.dribbble.com/users/1520130/screenshots/11008333/media/29cb675171cadd88e289ed9872e47b1c.jpg"
      ],
      "cartCount": 3,
      "categories": [
        {
          "name": "Shoes",
          "imagePath":
              "https://www.pngfind.com/pngs/m/48-480758_jordan-shoes-png-best-jordan-shoes-transparent-png.png"
        },
        {
          "name": "Bag",
          "imagePath":
              "https://toppng.com/uploads/preview/ucci-transparent-bag-gucci-bag-no-background-115629594552n1ydjagiv.png"
        },
        {
          "name": "Dress",
          "imagePath":
              "https://w7.pngwing.com/pngs/1005/532/png-transparent-tuxedo-suit-formal-wear-men-s-suits-black-notched-lapel-suit-blazer-illustration-men-suit-necktie-cartoon.png"
        },
        {
          "name": "Cars",
          "imagePath":
              "https://www.pinpng.com/pngs/m/207-2072599_png-mustang-with-transparent-background-png-download.png"
        },
        {
          "name": "Groceries",
          "imagePath":
              "https://www.pngfind.com/pngs/m/203-2037182_groceries-transparent-images-png-groceries-png-png-download.png"
        },
      ],
      "items": [
        {
          "id": "1",
          "name": "Item A",
          "brand": "Brand A",
          "category": "Category",
          "price": 58.00,
          "cartQty": 2.5
        },
        {
          "id": "1",
          "name": "Item A",
          "brand": "Brand A",
          "category": "Category",
          "price": 58.00,
          "cartQty": 2.5
        },
        {
          "id": "1",
          "name": "Item A",
          "brand": "Brand A",
          "category": "Category",
          "price": 58.00,
          "cartQty": 2.5
        }
      ]
    };

    //  throw "Json Momova";

    return HomePageDatas.fromJson(jsonDecoded);
  }
}
