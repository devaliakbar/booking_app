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
        "https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/ubxnsn4wcvscqmfjawjw",
        "https://content3.jdmagicbox.com/comp/gurgaon/v1/011pxx11.xx11.181113173312.z1v1/catalogue/pizza-galleria-gurgaon-sector-7-gurgaon-pizza-outlets-19axaatln9.jpg",
        "https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/k9uokyf2hqlvqs9usjxi"
      ]
    };

    //  throw "Json Momova";

    return ProductDetailModel.fromJson(jsonDecoded);
  }
}
