import 'package:food_app/entity/food.dart';

class FoodResponse {
  int success;
  List<Food> yemekler;
  FoodResponse({
    required this.success,
    required this.yemekler,
  });

  factory FoodResponse.fromJson(Map<String,dynamic> map){
    var jsonArray=map["yemekler"] as List;
    List<Food> yemekler=jsonArray.map((e) => Food.fromJson(e)).toList();
    return FoodResponse(success: map["success"], yemekler: yemekler);
  }
}
