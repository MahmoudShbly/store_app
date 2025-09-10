

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;
 

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.category,

 
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating:jsonData['rateing']!=null? RatingModel.fromJson(jsonData['rating']):RatingModel(rate: 0.0, count: 0)
 
    );
  }
}

class RatingModel {
  final double rate ;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsontData){
    return RatingModel(rate: (jsontData['rate']??0).toDouble(), count: jsontData['count']?? 0);
  }

}
