import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/app_cubit.dart';
import 'package:store_app/widgets/custom_card_bulider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        
        if (state is AppLoadingProductsState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AppErrorLoadingProductsState) {
          return const Center(child: Text('Failed to load products.'));
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 75, right: 16, left: 16),
            child: GridView.builder(
              itemCount:cubit.allProducts.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 85,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) => 
                  CustomCardBulider(
                    product: cubit.allProducts[index],
                  ),
            ),
          );
        }
      },
    );
  }
}
