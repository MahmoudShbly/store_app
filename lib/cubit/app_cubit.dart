import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/favouriet_products_page.dart';
import 'package:store_app/screens/home_page.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  List<ProductModel> favouriteProducts =[];
  void changeFavouriteState (ProductModel product){
    product.isFavouriet=!product.isFavouriet;
    if(product.isFavouriet) {
      bool alredyExist = favouriteProducts.any((item)=>item.id==product.id);
      if(!alredyExist){favouriteProducts.add(product);}
    }
    else{
      favouriteProducts.removeWhere((item)=>product.id==item.id);
    }
    emit(AppFavouriteChangeState()); 
  }
  
  int currentIndex = 0;
  void changeBottomNavigationBarIndex (index){
    currentIndex=index;
    emit(AppChangeBottomNavigationBarState());

    
  }
  List<Widget> get screens => [
        HomePage(),
        FavourietProductsPage(products: favouriteProducts),
      ];

}
