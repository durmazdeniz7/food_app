import 'dart:convert';

import 'package:food_app/entity/cart.dart';

class CartResponse {
  List<Cart> sepet;
  int succcess;
  CartResponse({
    required this.sepet,
    required this.succcess,
  });
  factory CartResponse.fromJson(Map<String, dynamic> map) {
    var jssonArray = map["sepet_yemekler"] as List;
    List<Cart> sepet =
        jssonArray.map((e) => Cart.fromJson(e)).toList();
    return CartResponse(sepet: sepet, succcess: map["success"]);
  }
}
