import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/cart_cubit.dart';
import 'package:food_app/entity/cart.dart';
import 'package:food_app/entity/food.dart';
import 'package:food_app/repo/food_dao_repo.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);
  FoodDaoRepo foodDaoRepo = FoodDaoRepo();

  Future<void> addToCart(Food food, String adet) async {
    var myList = await foodDaoRepo.getCart();

    /* for (var item in myList) {
      if (food.yemek_adi != item.yemek_adi) {
        await foodDaoRepo.addToCart(food, adet);
      }
      if (food.yemek_adi == item.yemek_adi) {
        adet =
            (int.parse(item.yemek_siparis_adet) + int.parse(adet)).toString();
        await foodDaoRepo.deleteToCard(item.sepet_yemek_id);
        await foodDaoRepo.addToCart(food, adet);
      }
    }
    await foodDaoRepo.addToCart(food, adet); */

    // for (var item in myList) {
    //   if (food.yemek_adi == item.yemek_adi) {
    //     adet =
    //         (int.parse(item.yemek_siparis_adet) + int.parse(adet)).toString();
    //     await foodDaoRepo.deleteToCard(item.sepet_yemek_id);
    //     await foodDaoRepo.addToCart(food, adet);
    //   } else {
    //     await foodDaoRepo.addToCart(food, adet);
    //   }
    // }
    if (myList.isNotEmpty) {
      for (var i = 0; i < myList.length; i++) {
        if (myList[i].yemek_adi == food.yemek_adi) {
          adet = (int.parse(myList[i].yemek_siparis_adet) + int.parse(adet))
              .toString();
          await foodDaoRepo
              .deleteToCard(myList[i].sepet_yemek_id)
              .then((value) async{
                 await foodDaoRepo.addToCart(food, adet);
              });
        } else {
          await foodDaoRepo.addToCart(food, adet);
        }
      }
    } else {
      await foodDaoRepo.addToCart(food, adet);
    }
  }
}
