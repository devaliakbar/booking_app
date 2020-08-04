import 'package:bookingapp/pages/category/bloc/data/category_model.dart';

class CategoryRepo {
  Future<CategoryPageData> getCategoryPageDatas() async {
    //FETCH FROM SERVER
    await Future.delayed(Duration(milliseconds: 500));

    var jsonDecoded = {
      "cartCount": 3,
      "categories": [
        {
          "id": "1",
          "name": "Food",
          "imagePath": "https://belllab.co/ba/11.png",
          "description":
              "People who had seen him were able to give a description!!"
        },
        {
          "id": "4",
          "name": "Fruits",
          "imagePath": "https://belllab.co/ba/22.png",
          "description": "A type or class of people or things!!"
        },
        {
          "id": "2",
          "name": "Coffee",
          "imagePath": "https://belllab.co/ba/33.png",
          "description":
              "People who had seen him were able to give a description!!"
        },
        {
          "id": "3",
          "name": "Fruits",
          "imagePath": "https://belllab.co/ba/11.png",
          "description": "A type or class of people or things!!"
        },
        {
          "id": "1",
          "name": "Food",
          "imagePath": "https://belllab.co/ba/22.png",
          "description":
              "People who had seen him were able to give a description!!"
        },
        {
          "id": "4",
          "name": "Fruits",
          "imagePath": "https://belllab.co/ba/33.png",
          "description": "A type or class of people or things!!"
        },
        {
          "id": "2",
          "name": "Coffee",
          "imagePath": "https://belllab.co/ba/22.png",
          "description":
              "People who had seen him were able to give a description!!"
        },
        {
          "id": "3",
          "name": "Fruits",
          "imagePath": "https://belllab.co/ba/11.png",
          "description": "A type or class of people or things!!"
        },
      ],
    };
    return CategoryPageData.fromJson(jsonDecoded);
  }
}
