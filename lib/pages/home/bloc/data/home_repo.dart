import 'package:bookingapp/pages/home/bloc/data/home_model.dart';

class HomeRepo {
  Future<HomePageDatas> getHomePageDatas() async {
//FETCH FROM SERVER
    await Future.delayed(Duration(seconds: 1));

    var jsonDecoded = {
      "bannersPath": [
        "https://image.freepik.com/free-psd/bio-food-banner-template-with-photo_23-2148211570.jpg",
        "https://i.pinimg.com/originals/68/72/af/6872af27c6d91f16d651fe2b747bced1.jpg",
        "https://cdn.dribbble.com/users/1520130/screenshots/11008333/media/29cb675171cadd88e289ed9872e47b1c.jpg"
      ],
      "cartCount": 3,
      "categories": ["Ca", "Cb", "Cc"],
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
