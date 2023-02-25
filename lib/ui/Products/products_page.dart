import 'package:fakedata_api_provider/view_model/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              return ListView.builder(
                  itemCount: value.products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.products[index].title),
                      subtitle: Text(value.products[index].price.toString()),
                      leading: SizedBox(
                          height: size.height * 0.1,
                          width: size.width * 0.2,
                          child: Image.network(value.products[index].image)),
                    );
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
