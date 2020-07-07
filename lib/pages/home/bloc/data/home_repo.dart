import 'package:bookingapp/pages/home/bloc/data/home_model.dart';

class HomeRepo {
  Future<HomePageDatas> getHomePageDatas() async {
//FETCH FROM SERVER
    await Future.delayed(Duration(seconds: 2));

    var jsonDecoded = {
      "bannersPath": [
        "https://static.insydo.com/wp-content/uploads/2018/05/Sofitel-jbr-iftar-in-dubai-1280x670.jpg",
        "https://www.visitdubai.com/-/media/dctcm/festivals/2020/ramadan/ramadan-sweets/hero/ramadan-sweets-hero-desktop-events-spotlight-1200x400%20copy.jpg",
        "https://previews.123rf.com/images/mizina/mizina2001/mizina200100121/138116022-middle-eastern-arabic-food-dinner-table-meat-kebab-hummus-tabbouleh-salad-traditional-sauces-olives-.jpg",
      ],
      "cartCount": 3,
      "categories": [
        {
          "id": "1",
          "name": "Biriyani",
          "imagePath": "https://www.avacare.in/images/recipes/ambur-biryani.jpg"
        },
        {
          "id": "2",
          "name": "Veg",
          "imagePath":
              "https://images-gmi-pmc.edge-generalmills.com/5bce0f7f-53dc-4fe1-9331-dfb2fe038c69.jpg"
        },
        {
          "id": "3",
          "name": "Arabian",
          "imagePath":
              "https://s3.ap-southeast-1.amazonaws.com/images.deccanchronicle.com/dc-Cover-ugf25iqf3i0j6fmaic2586hsf0-20180213072845.Medi.jpeg"
        },
        {
          "id": "4",
          "name": "Snacks",
          "imagePath":
              "https://www.grandecig.com/hs-fs/hubfs/images/blog_images/2019-Blog-Images/Savory_Snacks.jpg?width=734&name=Savory_Snacks.jpg"
        },
        {
          "id": "5",
          "name": "Drinks",
          "imagePath":
              "https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/beveragedaily.com/article/2020/03/31/beverage-webinar-today-what-drinks-do-consumers-want/10866454-1-eng-GB/Beverage-webinar-today-What-drinks-do-consumers-want.jpg"
        },
      ],
      "items": [
        {
          "id": "1",
          "name": "Mutton Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 10.00,
          "cartQty": 1,
          "imagePath":
              "https://sambadenglish.com/wp-content/uploads/2017/06/18582577_1310254749028670_4316696463441352313_n-1.jpg"
        },
        {
          "id": "2",
          "name": "Chicken Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 5.00,
          "cartQty": 0,
          "imagePath":
              "https://www.awesomecuisine.com/wp-content/uploads/2007/10/Chicken-Biryani_resized.jpg"
        },
        {
          "id": "3",
          "name": "Beef Biriyani",
          "brand": "Shopname",
          "category": "Biriyani",
          "price": 8.00,
          "cartQty": 0,
          "imagePath":
              "https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&w=750&h=393&url=https%3A%2F%2Fassets.marthastewart.com%2Fstyles%2Fwmax-750%2Fd40%2Fbeef-biryani-bobbi-lin-0041-d113199-0317%2Fbeef-biryani-bobbi-lin-0041-d113199-0317_horiz.jpg%3Fitok%3D2UuMyKHs"
        },
        {
          "id": "4",
          "name": "Chow Mein",
          "brand": "Shopname",
          "category": "Vegetable",
          "price": 12.00,
          "cartQty": 1,
          "imagePath":
              "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.foodandwine.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fmedium_2x%2Fpublic%2F201403-xl-vegetable-chow-mein.jpg%3Fitok%3D4c6b3_pt"
        },
        {
          "id": "5",
          "name": "Chicken Al Faham",
          "brand": "Shopname",
          "category": "Arabian",
          "price": 11.00,
          "cartQty": 0,
          "imagePath": "https://i.ytimg.com/vi/HVi7xxQZDRQ/maxresdefault.jpg"
        },
        {
          "id": "6",
          "name": "Chicken Mandi",
          "brand": "Shopname",
          "category": "Arabian",
          "price": 11.00,
          "cartQty": 0,
          "imagePath": "https://i.ytimg.com/vi/WBXgmNkyMz4/maxresdefault.jpg"
        },
        {
          "id": "7",
          "name": "Beef Alfaham",
          "brand": "Shopname",
          "category": "Arabian",
          "price": 11.00,
          "cartQty": 0,
          "imagePath":
              "https://b.zmtcdn.com/data/reviews_photos/356/a222e3643f21fdb744e734b008d5f356_1551629842.jpg"
        },
        {
          "id": "8",
          "name": "Mutton Mandi",
          "brand": "Shopname",
          "category": "Arabian",
          "price": 11.00,
          "cartQty": 0,
          "imagePath":
              "https://media-cdn.tripadvisor.com/media/photo-s/10/a6/83/a3/mutton-cooked-with-flavoured.jpg"
        },
        {
          "id": "9",
          "name": "Shawarma",
          "brand": "Shopname",
          "category": "Arabian",
          "price": 5.00,
          "cartQty": 1,
          "imagePath":
              "https://c.ndtvimg.com/2020-01/tvr3pq48_shawarma_120x90_21_January_20.jpg"
        },
        {
          "id": "10",
          "name": "Chatti Pathiri",
          "brand": "Shopname",
          "category": "Snacks",
          "price": 10.00,
          "cartQty": 1,
          "imagePath":
              "https://2.bp.blogspot.com/-iXhGNfH-yug/U7e4YFQ-0vI/AAAAAAAAi2M/zS7WxG726iM/s1600/chatti+pathil+1.jpg"
        },
        {
          "id": "11",
          "name": "Irachi Pathiri",
          "brand": "Shopname",
          "category": "Snacks",
          "price": 1.00,
          "cartQty": 1,
          "imagePath": "https://i.ytimg.com/vi/GwsMOE6ngYo/maxresdefault.jpg"
        },
        {
          "id": "12",
          "name": "Unnakai",
          "brand": "Shopname",
          "category": "Snacks",
          "price": 1.00,
          "cartQty": 0,
          "imagePath":
              "https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/09/ThalasseryRestaurant.jpg?w=1200&h=628&fill=blur&fit=fill"
        },
        {
          "id": "13",
          "name": "Avocado Shake",
          "brand": "Shopname",
          "category": "Drinks",
          "price": 15.00,
          "cartQty": 1,
          "imagePath":
              "https://www.thespruceeats.com/thmb/nFzB2C6IXkqwUk0NiT0LNyLs_OA=/1490x1490/smart/filters:no_upscale()/GettyImages-511024538-5afef110875db9003675c624.jpg"
        },
        {
          "id": "14",
          "name": "Tender Coconut",
          "brand": "Shopname",
          "category": "Drinks",
          "price": 15.00,
          "cartQty": 1,
          "imagePath":
              "https://dinetable.com/wp-content/uploads/2016/02/Tender-Coconut-Milkshake4.jpg"
        },
      ]
    };

    //  throw "Json Momova";

    return HomePageDatas.fromJson(jsonDecoded);
  }
}
