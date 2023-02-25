import 'package:fakedata_api_provider/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/product_item.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products Page'),
        ),
        body: Consumer<ProductViewModel>(
          builder: (context, value, child) {
            if (value.products.isNotEmpty) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: value.products.length,
                  itemBuilder: (context, index) {
                    return Product_item(
                        product: value.products[index], size: size);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            print('bosildi');
            context.read<ProductViewModel>().getAllPruoducts();
          },
          child: const Icon(Icons.add),
        ));
  }
}
