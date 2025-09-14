import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cubit/app_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_card_bulider.dart';

// ignore: must_be_immutable
class FavourietProductsPage extends StatelessWidget {
  FavourietProductsPage({super.key, required this.products});
  List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AppCubit.get(context).favouriteProducts.isEmpty
            ? Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('You have no Favourite Products ',style: TextStyle(color: Colors.grey),),
                    SizedBox(width: 5),
                    Icon(FontAwesomeIcons.heart,color: Colors.grey),
                  ],
                ),
            )
            : Padding(
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
      },
    );
  }
}
