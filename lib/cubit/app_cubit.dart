import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/product_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  void changeFavouriteState (ProductModel product){
    product.isFavouriet=!product.isFavouriet;
    emit(AppFavouriteChangeState()); 
  }
}
