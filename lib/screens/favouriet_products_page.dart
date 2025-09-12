import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_card_bulider.dart';

class FavourietProductsPage extends StatelessWidget {
 FavourietProductsPage({ super.key ,required this.products});
  List<ProductModel> products;
  @override
  Widget build(BuildContext context, ){
    return Padding(
      padding: EdgeInsets.only(top: 75, right: 16, left: 16),
      child: GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 85,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) =>
                    CustomCardBulider(product: products[index]),
              ),
    );
  }
}