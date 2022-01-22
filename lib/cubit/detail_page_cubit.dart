import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/entity/food.dart';
import 'package:food_app/repo/food_dao_repo.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);
  FoodDaoRepo foodDaoRepo=FoodDaoRepo();

  Future<void> addToCart(Food food, String adet) async{
    await foodDaoRepo.addToCart(food, adet);

  }
  
}