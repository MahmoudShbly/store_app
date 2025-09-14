import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cubit/app_cubit.dart';
import 'package:store_app/models/product_model.dart';

// ignore:must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('About this Product'),
            actions: [
              IconButton(
                onPressed: () => AppCubit.get(context).changeFavouriteState(product),
                icon: Icon(
                  Icons.favorite_sharp,
                  color: product.isFavouriet ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 32.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      product.image,
                      height: 300,
                      width: 200,
                    ),
                  ),
                  Text(
                    '${product.title}:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber),
                      Text(product.rating.rate.toString()),
                      SizedBox(width: 20),
                      Text('(${product.rating.count.toString()}) Reveiws'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.description,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    softWrap: true,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                ),SizedBox(
                                  width: 10,
                                ),
                                Icon(FontAwesomeIcons.cartShopping,color: Colors.white,),

                              ],
                            ),
                          ),
                        ),
                      ),

                      Text(
                        r'$'
                        '${product.price.toString()}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
