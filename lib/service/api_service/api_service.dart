import 'package:dio/dio.dart';
import 'package:fakedata_api_provider/data/models/product_models/product_models.dart';

class ApiService {
  String baseUrl = 'https://fakestoreapi.com';
  Future getProducts() async {
    print('responce keldi');
    Dio dio = Dio();
    Response response = await dio.get('$baseUrl/products');
    if (response.statusCode == 200) {
      print('ketdi');
      List products = response.data.map((e) {
        return ProductModels.fromJson(e);
      }).toList();

      return products;
    } else {
      return [];
    }
  }
}
