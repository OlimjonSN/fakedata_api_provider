import 'package:fakedata_api_provider/service/api_service/api_service.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  List products = [];
  bool isLoading = true;
  getAllPruoducts() async {
    loading();
    products = await ApiService().getProducts();
    loading();
  }

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
