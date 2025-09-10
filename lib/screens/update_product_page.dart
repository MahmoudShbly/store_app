import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatelessWidget {
  UpdateProductPage({super.key, required this.product});
  ProductModel product;
  String? productName, productDes, productImage,price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update This Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              CustomTextField(
                label: 'product name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              CustomTextField(
                label: ' description',
                onChanged: (data) {
                  productDes = data;
                },
              ),
              CustomTextField(
                label: ' price',
                onChanged: (data) {
                  price = data;
                },
                type: TextInputType.number,
              ),
              CustomTextField(
                label: ' image',
                onChanged: (data) {
                  productImage = data;
                },
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () async {
                  try {
                    await updateProduct();
                    print('Success');
                  } catch (e) {
                  print(e.toString());
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title:productName==null?product.title: productName!,
      price:price==null?product.price.toString(): price!,
      description:productDes==null?product.description: productDes!,
      image:productImage==null?product.image: productImage!,
      category: product.category,
    );
  }
}
