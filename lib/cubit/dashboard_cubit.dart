import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/entity/food.dart';
import 'package:food_app/repo/food_dao_repo.dart';

class DashBoardCubit extends Cubit<List<Food>> {
  DashBoardCubit() : super(<Food>[]);
  FoodDaoRepo foodDaoRepo = FoodDaoRepo();

  Future<void> getFood() async {
    var list = await foodDaoRepo.getFood();
    emit(list);
  }
}
