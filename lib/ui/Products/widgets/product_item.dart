import 'package:fakedata_api_provider/data/models/product_models/product_models.dart';
import 'package:flutter/material.dart';

class Product_item extends StatelessWidget {
  ProductModels product;
  Product_item({
    required this.product,
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Flexible(
          flex: 3,
          child: Container(
            child: Stack(
              children: [
                Image.network(
                  product.image,
                  height: size.height * 0.2,
                  width: size.width * 0.4,
                  fit: BoxFit.scaleDown,
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Text(
                    '${product.price} \$',
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.title),
            ),
          ),
        ),
      ]),
    );
  }
}
