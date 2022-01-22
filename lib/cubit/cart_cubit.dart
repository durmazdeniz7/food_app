import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/entity/cart.dart';
import 'package:food_app/repo/food_dao_repo.dart';

class CartCubit extends Cubit<List<Cart>> {
  CartCubit() : super(<Cart>[]);
FoodDaoRepo foodDaoRepo=FoodDaoRepo();

Future<void> getCard()async{
  var liste=await foodDaoRepo.getCart();
  emit(liste);
}
Future<void> deleteToCard(String id) async{
  await foodDaoRepo.deleteToCard(id);
}

  
}