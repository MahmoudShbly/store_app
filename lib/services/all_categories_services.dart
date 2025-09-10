import 'package:store_app/helpr/api.dart';
class CategoryServices {
  Future<List<dynamic>> getAllCategories ()async{
    
    List<dynamic> data =await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}